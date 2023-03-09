import 'package:flutter/material.dart';

final Uri faqLink = Uri.parse("https://knorr3.github.io/skin-detect-web/");

@immutable
class FAQEntry {
  const FAQEntry(
      {required this.id,
      required this.question,
      required this.subtitle,
      required this.description,
      this.link,
      this.buttonLink,
      this.linkLabel});

  final int id;
  final String question;
  final String subtitle;
  final List<String> description;
  final String? link;
  final String? buttonLink;
  final String? linkLabel;
}

final List<FAQEntry> faqInfo = [
  const FAQEntry(
    id: 1,
    question: "How do I use this app?",
    subtitle: "See the tutorial on our website.",
    link: "https://knorr3.github.io/skin-detect-web/",
    description: [],
  ),
  const FAQEntry(
      id: 2,
      question: "What is SkinDetect?",
      subtitle: "SkinDetect is an app that helps you to examine your skin.",
      description: [
        "SkinDetect is an app that helps you to examine skin lesions. You can take a picture of your skin lesion directly or upload a picture from the gallery. Our app then uses a specially trained AI to estimate how high the cancer risk is for your skin lesion.",
        "Our app does not replace a dermatologist! Everyone should be examined regularly by a professional dermatologist. You can find out more about this under the question \"Does this app replace a professional dermatologist?\"",
      ]),
  const FAQEntry(
      id: 3,
      question: "Does this app replace a dermatologist?",
      subtitle: "The short answer: No, absolutely not!",
      description: [
        'The short answer: No, absolutely not!',
        'This app uses an artificial intelligence specially trained by us to detect skin lesions. This "intelligence" was trained on a carefully selected set of data. If you suspect you have skin cancer, you should definitely see a dermatologist. This app is only intended to make a quick preliminary examination and in no way replaces a professional examination',
        'Right below you will find a button to search for dermatologists in your area on Doctolib.',
      ],
      buttonLink: 'https://www.doctolib.de/hautarzt',
      linkLabel: "Find a doctor"),
  const FAQEntry(
    id: 4,
    question: "How much does SkinDetect cost?",
    subtitle: "As the SkinDetect team, we value sustainability.",
    description: [
      'As the SkinDetect team, we value sustainability. People are important to us, not profit. That\'s why we offer our app completely free of charge. Not only can you use this app for free, but you can also view the entire source code and understand the training of our AI.'
    ],
  ),
  const FAQEntry(
    id: 5,
    question: "Can it help me detect skin cancer?",
    subtitle: "The goal of SkinDetect is to help you assess skin lesions.",
    description: [
      'The goal of SkinDetect is to help you assess skin lesions as quickly and reliably as possible. With SkinDetect you can detect eight different types of skin lesions:',
      '- Actinic keratoses and intraepithelial carcinoma, Bowen\'s disease\n' +
          '- Basal cell carcinoma\n' +
          '- Benign keratosis-like lesions (solar lentigines, seborrheic keratoses and lichen-planus like keratoses)\n' +
          '- Dermatofibroma\n' +
          '- Melanoma\n' +
          '- Melanocytic nevi\n' +
          '- Vascular lesions (angiomas, angiokeratomas, pyogenic granulomas and hemorrhage)',
      '- Squamous cell carcinoma',
      'Our app does not replace a dermatologist! Everyone should be examined regularly by a professional dermatologist. You can find out more about this under the question "Does this app replace a professional dermatologist?".'
    ],
  ),
  const FAQEntry(
    id: 6,
    question: "What are the symptoms of skin cancer?",
    subtitle: "Skin cancer is not always easy to recognize.",
    description: [
      'Skin cancer is not always easy for non-professionals to recognize, as it involves very different skin changes and often appears inconspicuous. Experts recognize basal cell carcinomas, for example, by their yellowish-reddish color, a bead-like edge and small blood vessels shining through on the surface. Squamous cell carcinomas (also called spinaliomas), on the other hand, form tactile lumps that have a firm scaly layer or crust on top.',
      'Both types of white skin cancer show up preferably on areas of the body known as "sun terraces": these are the areas that are particularly intensively exposed to UV rays in the sun. These include the forearms and the backs of the hands and, on the face, the bridge of the nose, the forehead, the edges of the ears and the lower lip. In men, scalps with little hair or bald patches are also areas where spinaliomas develop.',
      'Black skin cancer, also called melanoma (Greek: melanos = black), is also found preferentially in these areas. This can also often occur on the upper body of men and on the arms and legs of women. Melanomas form dark, differently colored spots without a clear border. They develop when the so-called melanocytes, the pigment cells of the skin, malform.',
      'Nine out of ten skin cancer patients have either a basal cell carcinoma or a spinalioma, the latter being three to four times more common. Men suffer slightly more frequently from the malignant skin changes than women. One out of ten affected persons has a melanoma, which corresponds to approximately 2500 new cases annually in Switzerland.',
      '(Source: toppharm.ch)',
    ],
  ),
  const FAQEntry(
    id: 7,
    question: "What happens to my personal data?",
    subtitle: "Our app runs completely offline on your device.",
    description: [
      'Our app runs completely offline on your device. No data is communicated, so you are the only person who has access to your data.',
      'We have applied a privacy-by-design approach, where no personal data is stored by default. Only when you save a scan to look at it again later, data is stored. All your data is encrypted before it is stored on your device. This happens completely offline and is therefore privacy-friendly.'
    ],
  ),
  const FAQEntry(
    id: 8,
    question: "What skin types does SkinDetect support?",
    subtitle: "Unfortunately, only white skin is supported at the moment.",
    description: [
      'Unfortunately, since the dataset for training the AI only contained white skin, dark skin types currently cannot be examined. This is a technical limitation that we want to address as soon as possible, improving cancer screening options for all skin types and humans.'
    ],
  ),
];
