### Introduction

The following use cases are exemplified with FHIR instances in this guide. Every effort has been made to be accurate, especially with regards to the AdverseEvent Clinical Research Profile instances, but these are intended as examples and may not include referenced data such as an Encounter. They are from real world examples and show how the AdveseEvent Clinical Research Profile is intended to be generally used. 

### Use Case 7 - Clinical trial: significant adverse event

(Link to [Use Case 7](https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase7-Clinicaltrial:significantadverseevent))

(Link to [Example AdverseEvent Clinical Research Profile](AdverseEvent-ClinicalResearchAdverseEventUseCase7.html))

Clinical Trial – Significant Adverse Event

This scenario involves a phase 2, clinical study evaluating the safety and efficacy of a new oral agent administered daily for treatment of severe psoriasis unresponsive to FDA-approved treatments.  There are two arms of the study – subjects receiving the new oral agent or a placebo.  Only the research pharmacist is aware of the arm assignment.    The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. 

The known risk profile of the new oral agent prior to this event included mild elevation of serum liver enzymes in 10% of subjects receiving the agent during previous clinical studies, but there was no other history of subjects developing clinically significant liver disease.  The IRB approved protocol and informed consent document for the study identifies mild liver injury as a risk of the research.

The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious.

### Use case 6B - for MedWatch Form FDA 3500B being used during a clinical trial

(Link to [Use Case 6B](https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase6-AdverseReactionreportingviaFDAMedWatchform))

(Link to [Example AdverseEvent Clinical Research Profile](AdverseEvent-clinical-research-ae-example-medwatch-patient-report.html))

Use case for MedWatch Form FDA 3500B being used during a clinical trial
  
A 64-year old woman (Janet) is participating in a breast cancer clinical trial. As part of her participation in the study, she was instructed to use a specific consumer facing FHIR application to report an adverse event that resulted in any of the following: hospitalization, required help to prevent permanent harm, disability or health problem, birth defect, life-threatening, death, other serious/important medical incident. (This list identifies serious events.)  

Janet created an account in the consumer facing FHIR application and imported her health records from her three (3) health systems. The data from her health systems were aggregated to allow her a single view of all her medical information. Janet was able to add more information that was not included in her imported data (OTC drugs, vitamins, etc.).  

After receiving the study drug (bresentrik) during a study visit, Janet went home and began vomiting uncontrollably. Her husband called an ambulance and Janet was taken to the hospital where she was treated in the ER and released.  

The following morning, Janet opened the study designated consumer facing FHIR application and completed the MedWatch Form FDA 3500B as earlier directed. The form provides her the opportunity to choose to auto fill several of the areas to allow for faster/easier completion of the form (demographics, meds, allergies, conditions, labs). She is given the option to display and choose the relevant items from each category (example: only current meds she is taking, current labs, etc. which might be a subset of her full PHR).  

When Janet clicked “Submit” on the electronic form, the data automatically flowed to the investigator (or to whomever was designated to receive the data). The data is then absorbed within the receiver’s system to auto populate a MedWatch Form FDA 3500B for submission to the FDA within 24 hours.


### Use Case 15 - Serious Adverse Event Research Study

(Link to [Use Case 15](https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-Usecase15-SeriousAdverseEventResearchStudyMedication))

(Link to [Example AdverseEvent Clinical Research Profile](AdverseEvent-ClinicalResearchAdverseEventUseCase15.html))

Patient SCHJO on Research Study XYZ, Study ID XYZ-123, Subject number XYZ-123-002. SCHJO was enrolled in the study on 12-Jun-2021 taking Study Medication ABC 10 mg orally daily every morning for atrial fibrillation to prevent thromboembolism.  On 2-Dec-2021, the subject XYZ-123-002 was hospitalized with a Gastrointestinal (GI) bleed. The investigator was notified of the event on the day of admission when the patient presented with vomiting a large amount of coffee-ground like hematemesis.  The investigator stopped the study drug because the event was “Possibly related” to the study drug.  The patient’s hemoglobin dropped to 6.5 g/dL and received 2 units of PRBCs.  The patient had an upper endoscopy that showed a moderate amount of bleeding from the esophagus. The site was cauterized, and the patient had no further bleeding after the procedure. The GI bleed resolved within one week after discontinuation of study drug and the patient was discharged on 9-Dec-2021 in good condition.

### Use Case 16 Non-Serious Adverse Event Research Study Medication

(Link to [Use Case 16](https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-Usecase16-Non-SeriousAdverseEventResearchStudyMedication))

(Link to [Example AdverseEvent Clinical Research Profile](AdverseEvent-ClinicalResearchAdverseEventUseCase16.html))

Patient MOUMIC on Research Study DISNEY, Study ID DUCK-828, Subject number DUCK-828-012. MOUMIC was enrolled in the study on 21-Jan-2022 taking Study Medication 20 mg subcutaneously daily every morning for diabetes.  At visit 3 on 21-Feb-2022, the patient stated that he had started to experience intermittent headaches on 1-Feb-2022 that were mild. They occurred once a week and resolved with Tylenol but were still ongoing. The investigator said the headaches were “UNLIKELY RELATED” to study drug.  The action taken with the study treatment was the “DOSE NOT CHANGED” and the outcome was noted to be “NOT RECOVERED/NOT RESOLVED”.

### Use Case 17 Non-Serious Adverse Event Related to Study Procedure (not study drug)

(Link to [Use Case 17](https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase17:AErelatedtostudyprocedure(notstudydrug)))

(Link to [Example AdverseEvent Clinical Research Profile](AdverseEvent-ClinicalResearchAdverseEventUseCase17.html))

Patient SLP on Research Study ACME, Study ID ACME-789, Subject number ACME-789-100. SLP was enrolled in the study on 2-Jan-2021, taking Study Medication WBY 10 mg orally daily every morning for moderate asthma.  
On 15-Jan-2021, the subject has the protocol-prescribed procedure of a Lung CT Scan, with contrast dye.  As a result of the contrast dye, the subject experiences moderate hives and itching from the contrast dye.  This is reported as an Adverse Event, related to study procedure.  He is treated with a Benadryl injection and recovers the same day.

The investigator said the reaction to the contrast dye was “UNLIKELY RELATED” to study drug.  The action taken with the study treatment was the “DOSE NOT CHANGED” and the outcome was noted to be “RECOVERED/RESOLVED”.

### Cancer Clinical Trial with Non-serious Adverse Events

This [use case persona](exampleCancerClinicalTrial.html) describes a hypothetical cancer patient on a cancer clinical trial with example instances to demonstrate how the adverse event profile can be used to guide the creation of resources representing a clinically realistic scenario.


