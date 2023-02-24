import 'package:flutter/material.dart';

const highTreatment = 'High risk - treatment necessary';
const harmlessNoTreatment = 'Harmless - no treatment necessary';
const highTreatmentRecommended = 'High risk - treatment recommended';
const mediumTreatment = 'Medium risk - treatment necessary';
const harmlessTreatmentPossible = 'Harmless - treatment possible';

@immutable
class CancerTypeEntry {
  const CancerTypeEntry({
    required this.id,
    required this.type,
    required this.shortLabel,
    required this.risk,
    required this.description,
    required this.descriptionShort,
    required this.riskText,
    required this.picture,
    required this.link,
    this.buttonLink,
    this.linkLabel,
  });

  final int id;
  final String type;
  final double risk;
  final String shortLabel;
  final String description;
  final String descriptionShort;
  final String riskText;
  final String picture;
  final String link;
  final String? buttonLink;
  final String? linkLabel;
}

final List<CancerTypeEntry> cTypes = [
  const CancerTypeEntry(
      id: 1,
      type: "Melanoma",
      shortLabel: "mel",
      risk: 0.9,
      description: 'Malignant melanoma is a serious form of skin cancer that begins in cells known as melanocytes.' +
          'While it is less common than basal cell carcinoma (BCC) and squamous cell carcinoma (SCC),' +
          'this skin cancer is more dangerous because of its ability to spread to other organs more rapidly' +
          'if it is not treated at an early stage.\n\n' +
          'Melanomas present in many different shapes, sizes and colors. That’s why it’s tricky to provide' +
          'a comprehensive set of warning signs. Melanoma are divided in four main types with' +
          'different growth behaviours and looks.\n\n' +
          'Melanoma is usually curable when detected and treated early.' +
          'Once it has spread deeper into the skin or other parts of the body,' +
          'it becomes more difficult to treat and can be deadly.\n\n' +
          'Not-So-Fun-Fact: One famous victim of this type of cancer is Bob Marley.\n\n' +
          '(Source: skincancer.org)',
      descriptionShort:
          'Malignant melanoma is a serious form of skin cancer that begins in cells known as melanocytes.' +
              'While it is less common than basal cell carcinoma (BCC) and squamous cell carcinoma (SCC),' +
              'this skin cancer is more dangerous because of its ability to spread to other organs more rapidly' +
              'if it is not treated at an early stage.\n\n(Source: skincancer.org)',
      link: "https://www.skincancer.org/skin-cancer-information/melanoma/",
      riskText: highTreatment,
      picture: "assets/images/mel.png"),
  const CancerTypeEntry(
      id: 2,
      type: "Melanocytic nevus",
      shortLabel: "nv",
      risk: 0.1,
      description: 'A melanocytic naevus (American spelling \'nevus\'), or mole, is a common benign skin lesion ' +
          'due to a local proliferation of pigment cells (melanocytes). It is sometimes called a ' +
          'naevocytic naevus or just \'naevus\' (but note that there are other types of naevi). ' +
          'A brown or black melanocytic naevus contains the pigment melanin, ' +
          'so may also be called a pigmented naevus.\n\n' +
          'A melanocytic naevus can be present at birth (a congenital melanocytic naevus) or ' +
          'appear later (an acquired naevus). There are various kinds of congenital and ' +
          'acquired melanocytic naevi (American spelling \'nevi\').\n\n' +
          'Almost everyone has at least one melanocytic naevus.\n' +
          '- About 1% of individuals are born with one or more congenital melanocytic naevi. ' +
          ' This is usually sporadic, with rare instances of familial congenital naevi.\n' +
          '- Fair-skinned people tend to have more melanocytic naevi than darker skinned people.\n' +
          '- Melanocytic naevi that appear during childhood (aged 2 to 10 years) tend to be the ' +
          'most prominent and persistent throughout life.\n' +
          '- Melanocytic naevi that are acquired later in childhood or adult life often follow sun ' +
          'exposure and may fade away or involute later.\n\n' +
          'Although the exact reason for the local proliferation of naevus cells is unknown, ' +
          'it is clear that the number of melanocytic naevi a person has depends on genetic factors, ' +
          'on sun exposure, and on immune status.\n' +
          '- People with many melanocytic naevi tend to have family members that also have many similar lesions.\n' +
          '- Somatic mutations in RAS genes are associated with congenital melanocytic naevi.\n' +
          '- New melanocytic naevi may erupt following the use of BRAF inhibitor drugs (vemurafenib, dabrafenib).\n' +
          '- People living in Australia and New Zealand have many more naevi than their relatives residing in Northern Europe.\n' +
          '- Immunosuppressive treatment leads to an increase in the numbers of naevi.\n\n(Source: dermnetnz.org)',
      descriptionShort: 'A melanocytic naevus (American spelling \'nevus\'), or mole, is a common benign skin lesion ' +
          'due to a local proliferation of pigment cells (melanocytes). It is sometimes called a ' +
          'naevocytic naevus or just \'naevus\' (but note that there are other types of naevi). ' +
          'A brown or black melanocytic naevus contains the pigment melanin, ' +
          'so may also be called a pigmented naevus.\n\n' +
          'A melanocytic naevus can be present at birth (a congenital melanocytic naevus) or ' +
          'appear later (an acquired naevus). There are various kinds of congenital and ' +
          'acquired melanocytic naevi (American spelling \'nevi\').\n\n(Source: dermnetnz.org)',
      link: "https://dermnetnz.org/topics/melanocytic-naevus",
      riskText: harmlessNoTreatment,
      picture: "assets/images/nv.png"),
  const CancerTypeEntry(
      id: 3,
      type: "Basal cell carcinoma",
      shortLabel: "bcc",
      risk: 0.75,
      description: 'Basal cell carcinoma (BCC) is the most common form of skin cancer and the most ' +
          'frequently occurring form of all cancers. In the U.S. alone, an estimated 3.6 million ' +
          'cases are diagnosed each year. BCCs arise from abnormal, uncontrolled growth of basa cells.\n' +
          'Because BCCs grow slowly, most are curable and cause minimal damage when caught ' +
          'and treated early. Understanding BCC causes, risk factors and warning signs can help ' +
          'you detect them early, when they are easiest to treat and cure.\n\n' +
          'BCCs can look like open sores, red patches, pink growths, shiny bumps, scars or growths ' +
          'with slightly elevated, rolled edges and/or a central indentation. At times, BCCs may ooze, ' +
          'crust, itch or bleed. The lesions commonly arise in sun-exposed areas of the body. ' +
          'In patients with darker skin, about half of BCCs are pigmented (meaning brown in color). ' +
          'It’s important to note that BCCs can look quite different from one person to another.\n\n' +
          'BCCs rarely spread beyond the original tumor site. But these lesions can grow and become disfiguring and dangerous. ' +
          'Untreated BCCs can become locally invasive, grow wide and deep into the skin and destroy skin, ' +
          'tissue and bone. The longer you wait to get treatment, the more likely it is that the BCC will recur, sometimes repeatedly. ' +
          'There are some highly unusual, aggressive cases when BCC spreads to other parts of the body. ' +
          'In even rarer instances, this type of BCC can become life-threatening.\n\n' +
          'Basal cell carcinoma is quite common. The number of reported cases in the U.S. has steadily increased. ' +
          'An estimated 3.6 million Americans are diagnosed with BCC each year and ' +
          'more than one out of every three new cancers are skin cancers, and the vast majority are BCCs.\n\n' +
          '(Source: skincancer.org)',
      descriptionShort: 'Basal cell carcinoma (BCC) is the most common form of skin cancer and the most ' +
          'frequently occurring form of all cancers. In the U.S. alone, an estimated 3.6 million ' +
          'cases are diagnosed each year. BCCs arise from abnormal, uncontrolled growth of basa cells.\n' +
          'Because BCCs grow slowly, most are curable and cause minimal damage when caught ' +
          'and treated early. Understanding BCC causes, risk factors and warning signs can help ' +
          'you detect them early, when they are easiest to treat and cure.\n\n(Source: skincancer.org)',
      link:
          "https://www.skincancer.org/skin-cancer-information/basal-cell-carcinoma/",
      riskText: highTreatmentRecommended,
      picture: "assets/images/bcc.png"),
  const CancerTypeEntry(
      id: 4,
      type: "Actinic keratosis-like lesions",
      shortLabel: "akiec",
      risk: 0.6,
      description: 'Actinic keratosis (AK) is the most common precancer that forms on skin damaged by chronic ' +
          'exposure to ultraviolet (UV) rays from the sun and/or indoor tanning. ' +
          'Solar keratosis is another name for the condition.\n' +
          'AKs result from long-term exposure to ultraviolet (UV) radiation. ' +
          'This means that if you already have an AK, you are likely to develop more actinic ' +
          'keratoses (plural) in the future. This puts you at a higher risk for skin cancer, ' +
          'since AKs can develop into squamous cell carcinoma (SCC), a common and sometimes invasive form of the disease.\n\n' +
          'AKs often appear as small dry, scaly or crusty patches of skin. They may be red, light or dark tan, white, pink, ' +
          'flesh-toned or a combination of colors and are sometimes raised. Because of their rough texture, ' +
          'actinic keratoses are often easier to feel than see.\n\n' +
          'The lesions frequently arise on sun-exposed areas of the face, lips, ears, scalp, ' +
          'shoulders, neck and the back of the hands and forearms. Another form of AK ' +
          'known as actinic cheilitis appears on the lower lip.\n\n' +
          'Even though just 5-10 percent of AKs turn into skin cancer, the vast majority of ' +
          'squamous cell carcinomas start off as AKs. That’s why it’s best to play it safe ' +
          'and see your dermatologist if you think you may have an AK.\n\n' +
          '(Source: skincancer.org)',
      descriptionShort: 'Actinic keratosis (AK) is the most common precancer that forms on skin damaged by chronic ' +
          'exposure to ultraviolet (UV) rays from the sun and/or indoor tanning. ' +
          'Solar keratosis is another name for the condition.\n' +
          'AKs result from long-term exposure to ultraviolet (UV) radiation. ' +
          'This means that if you already have an AK, you are likely to develop more actinic ' +
          'keratoses (plural) in the future. This puts you at a higher risk for skin cancer, ' +
          'since AKs can develop into squamous cell carcinoma (SCC), a common and sometimes invasive form of the disease.\n\n(Source: skincancer.org)',
      link:
          'https://www.skincancer.org/skin-cancer-information/actinic-keratosis/',
      riskText: mediumTreatment,
      picture: "assets/images/akiec.png"),
  const CancerTypeEntry(
      id: 5,
      type: "Benign keratosis",
      shortLabel: "bkl",
      risk: 0.1,
      description: 'Benign keratosis is a broader term that is used to include the following related scaly skin lesions:\n' +
          'Seborrhoeic keratosis, ' +
          'Solar lentigo (which can be difficult to distinguish from a flat seborrhoeic keratosis), ' +
          'Lichen planus-like keratosis (which arises from a seborrhoeic keratosis or a solar lentigo).\n\n' +
          'Seborrhoeic keratosis is a harmless warty spot that appears during ' +
          'adult life as a common sign of skin ageing. Some people have hundreds of them. ' +
          'Seborrhoeic keratosis (American spelling - seborrheic keratosis) is also called SK, ' +
          'basal cell papilloma, senile wart, brown wart, wisdom wart, or barnacle.\n\n' +
          'Seborrhoeic keratoses are extremely common. It has been estimated that over 90% of adults over the age of 60 years ' +
          'have one or more of them. They occur in males and females of all races, typically beginning to erupt in the 30s or 40s. ' +
          'They are uncommon under the age of 20 years.\n\n' +
          'The precise cause of seborrhoeic keratoses is not known. ' +
          'The name is misleading, because they are not limited to a seborrhoeic distribution (scalp, mid-face, chest, upper back) ' +
          'as in seborrhoeic dermatitis, nor are they formed from sebaceous glands, as is the case with sebaceous hyperplasia, ' +
          'nor are they associated with sebum — which is greasy. ' +
          'Seborrhoeic keratoses are considered degenerative in nature. As time goes by, seborrhoeic keratoses become more numerous. Some people inherit a tendency to develop a very large number of them. \n\n' +
          '(Source: dermnetnz.org)',
      descriptionShort:
          'Benign keratosis is a broader term that is used to include the following related scaly skin lesions:\n' +
              'Seborrhoeic keratosis, ' +
              'Solar lentigo (which can be difficult to distinguish from a flat seborrhoeic keratosis), ' +
              'Lichen planus-like keratosis (which arises from a seborrhoeic keratosis or a solar lentigo).\n\n(Source: dermnetnz.org)',
      link: 'https://dermnetnz.org/topics/seborrhoeic-keratosis',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/bkl.png"),
  const CancerTypeEntry(
      id: 6,
      type: "Dermatofibroma",
      shortLabel: "df",
      risk: 0.1,
      description: 'A dermatofibroma is a common benign fibrous nodule usually found on the skin of the lower legs. ' +
          'A dermatofibroma is also called a cutaneous fibrous histiocytoma. ' +
          'Dermatofibromas are mostly seen in adults. People of every ethnicity can develop dermatofibromas. Ordinary ' +
          'dermatofibromas are more common in women than in men, although some histologic variants are more commonly ' +
          'identified in males.\n\n' +
          'It is not clear if dermatofibroma is a reactive process or a true neoplasm. The lesions are composed of proliferating ' +
          'fibroblasts. Histiocytes may also be involved. ' +
          'They are sometimes attributed to minor trauma including insect bites, injections, or a rose thorn injury, but not ' +
          'consistently. Multiple dermatofibromas can develop in patients with altered immunity such as HIV, ' +
          'immunosuppression, or autoimmune conditions.' +
          '\n\n(Source: dermnetnz.org)',
      descriptionShort:
          'A dermatofibroma is a common benign fibrous nodule usually found on the skin of the lower legs. ' +
              'A dermatofibroma is also called a cutaneous fibrous histiocytoma. ' +
              'Dermatofibromas are mostly seen in adults. People of every ethnicity can develop dermatofibromas. Ordinary ' +
              'dermatofibromas are more common in women than in men, although some histologic variants are more commonly ' +
              'identified in males.\n\n(Source: dermnetnz.org)',
      link: 'https://dermnetnz.org/topics/dermatofibroma',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/df.png"),
  const CancerTypeEntry(
      id: 7,
      type: "Vascular lesion",
      shortLabel: "vasc",
      risk: 0.1,
      description: 'Vascular lesions are relatively common abnormalities of the skin and underlying tissues, more ' +
          'commonly known as birthmarks. There are three major categories of vascular lesions: ' +
          'Hemangiomas, Vascular Malformations, and Pyogenic Granulomas. While these birthmarks can ' +
          'look similar at times, they each vary in terms of origin and necessary treatment.\n\n' +
          '(Source: ssmhealth.com)',
      descriptionShort:
          'Vascular lesions are relatively common abnormalities of the skin and underlying tissues, more ' +
              'commonly known as birthmarks. There are three major categories of vascular lesions: ' +
              'Hemangiomas, Vascular Malformations, and Pyogenic Granulomas. While these birthmarks can ' +
              'look similar at times, they each vary in terms of origin and necessary treatment.\n\n' +
              '(Source: ssmhealth.com)',
      link:
          'https://www.ssmhealth.com/cardinal-glennon/pediatric-plastic-reconstructive-surgery/hemangiomas',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/vasc.png"),
];
