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
            return EnumAttribute_BinaryBirds<Crossorigin>(attribute: attribute).swiftCode
        case "dir":
            return EnumAttribute_BinaryBirds<TextDirection>(attribute: attribute).swiftCode
        case "draggable":
            return EnumAttribute_BinaryBirds<Draggable>(attribute: attribute).swiftCode
        case "enctype":
            return EnumAttribute_BinaryBirds<Enctype>(attribute: attribute).swiftCode
        case "http-equiv":
            return EnumAttribute_BinaryBirds<SwiftHtml.Meta.HttpEquiv>(attribute: attribute).swiftCode
        case "kind":
            return EnumAttribute_BinaryBirds<Track.Kind>(attribute: attribute).swiftCode
        case "method":
            return EnumAttribute_BinaryBirds<SwiftHtml.Method>(attribute: attribute).swiftCode
        case "preload":
            return EnumAttribute_BinaryBirds<Audio.Preload>(attribute: attribute).swiftCode
        case "referrerpolicy":
            return EnumAttribute_BinaryBirds<RefererPolicy>(attribute: attribute).swiftCode
        case "rel":
            return EnumAttribute_BinaryBirds<A.Rel>(attribute: attribute).swiftCode
        case "reversed":
            return EnumAttribute_BinaryBirds<Ol.`Type`>(attribute: attribute).swiftCode
        case "sandbox":
            return EnumAttribute_BinaryBirds<IframeSandbox>(attribute: attribute).swiftCode
        case "scope":
            return EnumAttribute_BinaryBirds<Th.Scope>(attribute: attribute).swiftCode
        case "shape":
            return EnumAttribute_BinaryBirds<Area.Shape>(attribute: attribute).swiftCode
        case "start":
            return EnumAttribute_BinaryBirds<Ol.`Type`>(attribute: attribute).swiftCode
        case "target":
            return EnumAttribute_BinaryBirds<Target>(attribute: attribute).swiftCode
        case "translate":
            return EnumAttribute_BinaryBirds<Translate>(attribute: attribute).swiftCode
        case "wrap":
            return EnumAttribute_BinaryBirds<Textarea.Wrap>(attribute: attribute).swiftCode

        // MARK: Parent-dependent Attributes

        case "name":
            switch element.nodeName() {
                case "meta":
                    return EnumAttribute_BinaryBirds<Meta.Name>(attribute: attribute).swiftCode
                default:
                    return PredefinedMethodAttribute_BinaryBirds(attribute: attribute).swiftCode
            }

        case "type":
            switch element.nodeName() {
                case "input":
                    return EnumAttribute_BinaryBirds<Input.`Type`>(attribute: attribute).swiftCode
                case "button":
                    return EnumAttribute_BinaryBirds<Button.`Type`>(attribute: attribute).swiftCode
//                case "link":
//                    return EnumAttribute_BinaryBirds<Medias>(attribute: attribute).swiftCode
//                case "script":
//                    return EnumAttribute_BinaryBirds<Medias>(attribute: attribute).swiftCode
//                case "audio":
//                    return EnumAttribute_BinaryBirds<Medias>(attribute: attribute).swiftCode
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
