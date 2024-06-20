#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"


#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <desktop_multi_window/desktop_multi_window_plugin.h>
#include <flutter_webrtc/flutter_web_r_t_c_plugin.h>
#include <livekit_client/live_kit_plugin.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <texture_rgba_renderer/texture_rgba_renderer_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>
#include <window_manager/window_manager_plugin.h>
#include <window_size/window_size_plugin.h>

#include <iostream>

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
    DesktopMultiWindowSetWindowCreatedCallback([](void *controller) {
        auto *flutter_view_controller =
                reinterpret_cast<flutter::FlutterViewController *>(controller);
        auto *registry = flutter_view_controller->engine();
       std::cout << "DesktopMultiWindowSetWindowCreatedCallback register" << std::endl;

       FlutterWebRTCPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("FlutterWebRTCPlugin"));
       ConnectivityPlusWindowsPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
         LiveKitPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("LiveKitPlugin"));
         PermissionHandlerWindowsPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
         ScreenRetrieverPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
         SharePlusWindowsPluginCApiRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
         TextureRgbaRendererPluginCApiRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("TextureRgbaRendererPluginCApi"));
         UrlLauncherWindowsRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("UrlLauncherWindows"));
         WindowManagerPluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("WindowManagerPlugin"));
         WindowSizePluginRegisterWithRegistrar(
             registry->GetRegistrarForPlugin("WindowSizePlugin"));
    });
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}