import XCTest
@testable import MuralCore

final class RioplatenseSpanishTests: XCTestCase {
    func testModuleIsSeparateFromSpainSpanish() throws {
        let argentina = try XCTUnwrap(LanguageRegistry.module(for: "es-AR"))
        let spain = try XCTUnwrap(LanguageRegistry.module(for: "es"))
        XCTAssertEqual(argentina.locale, "es-AR")
        XCTAssertEqual(argentina.settingsTitle, "Spanish · Argentina")
        XCTAssertEqual(spain.variety, "Spain")
        XCTAssertTrue(argentina.speechGuidance.contains("voseo"))
        XCTAssertNotEqual(argentina.themes.first { $0.id == "coffee" }?.situation, spain.themes.first { $0.id == "coffee" }?.situation)
    }

    func testPromptsUseRioplatenseGuidance() throws {
        let language = try XCTUnwrap(LanguageRegistry.module(for: "es-AR"))
        let voice = TeachingPolicy.voice(language: language, learner: LearningEngine.project([], languageID: "es-AR"),
            theme: language.themes[0], interests: "", meaningLanguage: "English")
        XCTAssertTrue(voice.contains("Sos Mural"))
        XCTAssertTrue(voice.contains("Corregí un error"))
        XCTAssertFalse(voice.contains("Eres Mural"))
        XCTAssertTrue(TeachingPolicy.assessment(language: language).contains("Use language es-AR for target-language evidence"))
    }

    func testEvidenceAndProgressStayIsolatedFromSpainSpanish() throws {
        let date = Date(timeIntervalSince1970: 1_780_000_000)
        func session(_ id: String) -> SessionRecord {
            var result = SessionRecord(languageID: id, themeID: "coffee")
            result.startedAt = date
            result.append(Fragment(speaker: .user, text: "Vos tenés razón.", startMS: 0, endMS: 3000, receivedAt: date, meaningVisible: false, typed: false))
            let passage = result.passages[0]
            result.assessments = [Assessment(passageID: passage.id, revisionKey: passage.revisionKey, outcome: .success,
                suggestedLevel: 2, nextGoal: "Contar un plan", capability: "Agrees with someone",
                words: [WordProposal(lemma: "tener", meaning: "to have", form: "tenés", kind: .independent, confidence: 0.95,
                    sourceIDs: passage.fragments.map(\.id), quote: "Vos tenés razón.", language: id)], createdAt: date)]
            return result
        }
        let sessions = [session("es-AR")]
        XCTAssertEqual(LearningEngine.project(sessions, languageID: "es-AR", now: date).words.map(\.lemma), ["tener"])
        XCTAssertTrue(LearningEngine.project(sessions, languageID: "es", now: date).words.isEmpty)
        var archive = Archive()
        archive.sessions = sessions
        archive.preferences.learningLanguageID = "es-AR"
        let restored = try Archive.decode(archive.encoded())
        XCTAssertEqual(restored.preferences.learningLanguageID, "es-AR")
        XCTAssertEqual(restored.sessions.map(\.languageID), ["es-AR"])
    }
}
