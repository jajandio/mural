import Foundation

extension LanguageModule {
    public static let spanishArgentina = LanguageModule(
        id: "es-AR", name: "Spanish", nativeName: "Español", variety: "Argentina", locale: "es-AR",
        greeting: "¡Hola!", greetingWord: "hola",
        speechGuidance: "Use clear, natural Rioplatense Spanish from Buenos Aires: voseo for friendly singular address (vos tenés, vos sos, vení, decime), ustedes for every plural address, seseo, and the Rioplatense pronunciation of ll and y (sheísmo/zheísmo), with the typical intonation kept natural and unexaggerated. Prefer everyday Argentine vocabulary such as colectivo, subte, auto, celular, departamento and plata. Accept tú, vosotros, the distinction between s and z/soft c, and other valid regional forms without marking them wrong. Do not imitate a caricature or overload the conversation with lunfardo; introduce common colloquial words only when natural and explain them if needed.",
        writingGuidance: "Use standard Spanish spelling, accents and opening question and exclamation marks. Write voseo forms with their standard accents (tenés, sos, vení, contame).",
        lemmaGuidance: "Give nouns with their singular grammatical article and verbs in the infinitive, for example la casa and hablar. Keep reflexive verbs such as llamarse distinct. Preserve accents and ñ. Lemmatise voseo forms to the ordinary infinitive (tenés → tener, vení → venir).",
        teachingFocus: [
            "Greetings, introductions and short useful chunks such as me llamo, ¿cómo andás? and quiero.",
            "Everyday questions, gender and number agreement, present tense with vos (vos hablás, vos tenés) and useful ser/estar contrasts.",
            "Connected stories, past events, object pronouns, voseo imperatives (decime, contame) and familiar situations.",
            "Reasons and opinions, contrasts between past tenses, periphrastic future (voy a…) and common subjunctive contexts, including voseo forms.",
            "Nuance, hypothetical situations, register, common colloquial Argentine expressions and regional variation.",
            "Flexible advanced discussion with precise, idiomatic Rioplatense Spanish."
        ],
        topicPlaceholder: "Food, football, music, life in Buenos Aires…",
        lookupUnavailableReply: "No pude chequearlo ahora. Si querés, podemos charlar del tema en general.",
        themeOverrides: [
            "coffee": .init("coffee", "Un cortado", "Something warm, please", "cup.and.saucer", "Everyday", "Meet in a neighbourhood café in Buenos Aires. Order a cortado and medialunas and chat. Ask about the learner's interests.", 0),
            "groceries": .init("groceries", "En la feria", "A little of everything", "basket", "Everyday", "Shop at a neighbourhood feria or verdulería in Argentina. Practise quantities, prices and polite questions. Respect regional food vocabulary.", 2),
            "travel": .init("travel", "Next stop", "A ticket to somewhere", "tram", "Everyday", "Plan getting around Argentina by colectivo, subte, train or long-distance micro. Discuss transport and tickets without inventing current schedules or fares.", 1),
            "cabin": .init("cabin", "A weekend away", "Somewhere outside the city", "mountain.2", "Local life", "Plan an imagined weekend away in Argentina. Choose the sierras, the coast, the delta or the countryside together and discuss practical plans.", 2),
            "traditions": .init("traditions", "La sobremesa", "Let the conversation linger", "fork.knife", "Local life", "Talk over mate after a Sunday asado about daily routines, family and local customs. Compare experiences without treating Argentina or Spanish-speaking cultures as uniform.", 2)
        ]
    )
}
