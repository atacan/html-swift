//
// https://github.com/atacan
// 30.07.22

import Foundation
import SwiftHtml
import SwiftSoup

func codeOfAttributeBinaryBirds(_ attribute: SwiftSoup.Attribute, of element: Element) -> String {
    switch attribute.getKey() {
        // MARK: - Bool

        case "autocomplete", "checked", "contenteditable", "spellcheck":
            return StandardTypeAttribute<DefaultedBool>(attribute: attribute).swiftCode

        // MARK: - Int

        case "cols", "colspan", "high", "low", "optimum", "rows", "rowspan", "size", "span", "step", "tabindex":
            return StandardTypeAttribute<Int>(attribute: attribute).swiftCode

        // MARK: - Double

        case "height", "width":
            return StandardTypeAttribute<Double>(attribute: attribute).swiftCode

        // MARK: - String

        case "accept", "accesskey", "action", "alt", "charset", "cite", "class", "content", "data", "datetime", "for", "form", "formaction", "headers", "href", "hreflang", "id", "label", "lang", "list", "max", "media", "min", "open", "pattern", "ping", "placeholder", "poster", "sizes", "src", "style", "title", "value":
            return PredefinedMethodAttribute_BinaryBirds(attribute: attribute).swiftCode

        // MARK: - No Value

        case "async", "autofocus", "autoplay", "controls", "default", "defer", "disabled", "download", "hidden", "ismap", "loop", "multiple", "muted", "novalidate", "readonly", "required", "selected":
            return EmptyAttribute_BinaryBirds(attribute: attribute).swiftCode

        // MARK: Enums

        case "crossorigin":
            return EnumAttribute<Crossorigin>(attribute: attribute).swiftCode
        case "dir":
            return EnumAttribute<TextDirection>(attribute: attribute).swiftCode
        case "draggable":
            return EnumAttribute<Draggable>(attribute: attribute).swiftCode
        case "enctype":
            return EnumAttribute<Enctype>(attribute: attribute).swiftCode
        case "http-equiv":
            return EnumAttribute<SwiftHtml.Meta.HttpEquiv>(attribute: attribute).swiftCode
        case "kind":
            return EnumAttribute<Track.Kind>(attribute: attribute).swiftCode
        case "method":
            return EnumAttribute<SwiftHtml.Method>(attribute: attribute).swiftCode
        case "preload":
            return EnumAttribute<Audio.Preload>(attribute: attribute).swiftCode
        case "referrerpolicy":
            return EnumAttribute<RefererPolicy>(attribute: attribute).swiftCode
        case "rel":
            return EnumAttribute<A.Rel>(attribute: attribute).swiftCode
        case "reversed":
            return EnumAttribute<Ol.`Type`>(attribute: attribute).swiftCode
        case "sandbox":
            return EnumAttribute<IframeSandbox>(attribute: attribute).swiftCode
        case "scope":
            return EnumAttribute<Th.Scope>(attribute: attribute).swiftCode
        case "shape":
            return EnumAttribute<Area.Shape>(attribute: attribute).swiftCode
        case "start":
            return EnumAttribute<Ol.`Type`>(attribute: attribute).swiftCode
        case "target":
            return EnumAttribute<Target>(attribute: attribute).swiftCode
        case "translate":
            return EnumAttribute<Translate>(attribute: attribute).swiftCode
        case "wrap":
            return EnumAttribute<Textarea.Wrap>(attribute: attribute).swiftCode

        // MARK: Parent-dependent Attributes

        case "name":
            switch element.nodeName() {
                case "meta":
                    return EnumAttribute<Meta.Name>(attribute: attribute).swiftCode
                default:
                    return PredefinedMethodAttribute_BinaryBirds(attribute: attribute).swiftCode
            }

        case "type":
            switch element.nodeName() {
                case "input":
                    return EnumAttribute<Input.`Type`>(attribute: attribute).swiftCode
                case "button":
                    return EnumAttribute<Button.`Type`>(attribute: attribute).swiftCode
//                case "link":
//                    return EnumAttribute<Medias>(attribute: attribute).swiftCode
//                case "script":
//                    return EnumAttribute<Medias>(attribute: attribute).swiftCode
//                case "audio":
//                    return EnumAttribute<Medias>(attribute: attribute).swiftCode
                default:
                    return PredefinedMethodAttribute_BinaryBirds(attribute: attribute).swiftCode
            }

//    // TODO: list of doubles
//    case "coords":
//        ValueProperty(node: attribute).build()

        default:
            return UndefinedAttribute_BinaryBirds(attribute: attribute).swiftCode
    }
}


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
