import Vapor
import Fluent

final class Skill: Model {

    typealias IDValue = UUID

    static var schema: String = "skills"

    @ID()
    var id: IDValue?

    @OptionalField(key: FieldKeys.profesional.rawValue)
    var profesional: [String]?

    @OptionalField(key: FieldKeys.workflow.rawValue)
    var workflow: [String]?

    @Parent(key: FieldKeys.user.rawValue)
    var user: User

    init() {}
}

extension Skill {

    enum FieldKeys: FieldKey {
        case profesional
        case workflow
        case user = "user_id"
    }
}

extension Skill: Serializing {

    typealias SerializedObject = Coding

    struct Coding: Content, Equatable {

        var id: IDValue?
        var profesional: [String]?
        var workflow: [String]?
    }

    convenience init(content: SerializedObject) {
        self.init()
        profesional = content.profesional
        workflow = content.workflow
    }

    func reverted() throws -> SerializedObject {
        try SerializedObject.init(id: requireID(), profesional: profesional, workflow: workflow)
    }
}

extension Skill: Mergeable {

    func merge(_ other: Skill) {
        profesional = other.profesional
        workflow = other.workflow
    }
}

extension Skill: UserOwnable {
    static var uidFieldKey: FieldKey {
        return FieldKeys.user.rawValue
    }

    var _$user: Parent<User> {
        $user
    }
}
