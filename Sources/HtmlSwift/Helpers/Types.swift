// https://github.com/atacan/
// 28.05.22
//

import SwiftHtml

enum IframeSandbox: String {
    /// (no value)    Applies all restrictions
    case all
    /// Allows form submission
    case allowForms
    /// Allows to open modal windows
    case allowModals
    /// Allows to lock the screen orientation
    case allowOrientationLock
    /// Allows to use the Pointer Lock API
    case allowPointerLock
    /// Allows popups
    case allowPopups
    /// Allows popups to open new windows without inheriting the sandboxing
    case allowPopupsToEscapeSandbox
    /// Allows to start a presentation session
    case allowPresentation
    /// Allows the iframe content to be treated as being from the same origin
    case allowSameOrigin
    /// Allows to run scripts
    case allowScripts
    /// Allows the iframe content to navigate its top-level browsing context
    case allowTopNavigation
    /// Allows the iframe content to navigate its top-level browsing context, but only if initiated by user
    case allowTopNavigationByUserActivation
}
