
//Extension: StudyInfoassociatedWithAE
//Id: study-info-associated-with-AE
//Title: "Study information associated with an Adverse Event"
//Description: "Informaiton about a research study invovled in an adverse event experinced by a patient."
//* extension contains
//    studyAssociatedWithAE 1..1 MS and
//    researchSubjectAssociatedWithAE 1..1 and
//    expectedInResearchStudy 0..1 MS and
//    AEcausedStudyDiscontinuation 0..1 MS
//* extension[studyAssociatedWithAE] ^short = "Clinical Research Study associted with the Adverse Event"
//* extension[studyAssociatedWithAE].value[x] only Reference(ResearchStudy)

//* extension[researchSubjectAssociatedWithAE] ^short = "Clinical Research Study subject who experienced the adverse event"
//* extension[researchSubjectAssociatedWithAE].value[x] only Reference(ResearchSubject)

//* extension[expectedInResearchStudy] ^short = "Considered likely or probable or anticipated in a research study"
//* extension[expectedInResearchStudy].value[x] only boolean

//* extension[AEcausedStudyDiscontinuation] ^short = "Adverse Event led to study discontinuation"
//* extension[AEcausedStudyDiscontinuation].value[x] only boolean

//Extension: StudyAssociated
//Id: study-associated
//Title: "study-associated"
//Description: "A research study that is assoicaited with a treatment, event, protocol, etc..."
//* value[x] only Reference(ResearchStudy)

Extension: Note
Id: note
Title: "Note"
Description: "Comments made about the adverse event by the performer, subject or other participants."
* value[x] only Annotation

Extension: ExpectedInResearchStudy
Id: expected-in-research-study
Title: "Expected In Research Study"
Description: "Considered likely or probable or anticipated in the research study.  Whether the reported event matches any of the outcomes for the patient that are considered by the study as known or likely."
* value[x] only boolean

Extension: SeverityOrGrade
Id: severity-or-grade
Title: "Severity Or Grade"
Description: "Describes the severity of the adverse event, in relation to the subject not the resulting condition. In the context of clinical research, it is the investigator's assessment of severity. For cancer related trials, severity is represented as a grade. An AdverseEvent.resultingCondition might have mild severity clinically, but a Research Investigator may determine that for the context of the clinical trial the adverseEvent severity-or-grade is severe"
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/R4/valueset-adverse-event-severity.html (preferred)
//http://hl7.org/fhir/ValueSet/adverse-event-severity (extensible)

Extension: Seriousness
Id: seriousness
Title: "Seriousness"
Description: "Clinical significance of adverse event based on the patient and event outcome."
* extension contains
    serious 1..1 MS and
    seriousnessCriteria 0..*
* extension[serious] ^short = "Was the adverse event serious or not."
//* extension[serious] ^descripton = 
* extension[serious].value[x] only boolean

* extension[seriousnessCriteria] ^short = "Action criteria usually associated with events that pose a threat to a patient's life or functioning"
//* extension[seriousnessCriteria] ^description = 
* extension[seriousnessCriteria].value[x] only CodeableConcept
//* extension[seriousnessCriteria].valueCodeableConcept from adverse-event-seriousness-criteria-vs (extensible)
* obeys aeClinRes-seriousness-1

ValueSet: AdverseEventSerCrit
Id: adverse-event-seriousness-criteria-vs
Title: "Adverse Event Seriousness Criteria"
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning. Adverse Events criteria to expand on the seriousness of the adverse event. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Medwatch forms). This list comes from ICH E2B R3 (https://database.ich.org/sites/default/files/E2D_Guideline.pdf)."
//* codes from system seriousness-criteria-cs
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34	"resultsInDeath" //"Was the serious adverse event life-threatening?"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21	"isLifeThreatening" 
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33	"requiresInpatientHospitalization"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35	"resultsInPersistentOrSignificantDisability"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12	"congenitalAnomalyBirthDefect"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26	"otherMedicallyImportantCondition" 


CodeSystem: SeriousnessCriteriaCS
Id: seriousness-criteria-cs
Title: "Seriousness Criteria Code System"
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning"
* #resultsInDeath "Resulted in Death" "Adverse event resulted in death"
* #lifeThreatening "Life Threatening" "Life Threatening"
* #resultsinHospitalization "Resulted in Hospitalization" "Resulted in Hospitalization"
* #resultsInDisabliity "Resulted in Disability" "Resulted in Disability"
* #isBirthDefect "Resulted in Birth defect" "Resulted in Birth Defect"
* #requiresPreventImpairment "Required Intervention" "Required Intervention to Prevent Permanent Impairment or Damage"

Invariant: aeClinRes-seriousness-1
Description: "If serious is true then must have at least one seriousness criteria."
Expression: "extension[seriousness].where(extension[serious]=true) and extension[seriousness].extension[seriousnessCriteria].valueCodeableConcept.empty()"
Severity: #error
//XPath: "extension[seriousness].where(extension[serious]=true) AND extension[seriousnessCriteria].valueCodeableConcept.empty()"

Invariant:      cnt-3
Description:    "There SHALL be a code with a value of '1' if there is a value. If system is present, it SHALL be UCUM. If present, the value SHALL be a whole number."
Expression:     "(code.exists() or value.empty()) and (system.empty() or system = %ucum) and (code.empty() or code = '1') and (value.empty() or value.hasValue().not() or value.toString().contains('.').not())"
Severity:       #error


Profile: AdverseEventClinicalResearch
Parent: AdverseEvent
Id: AdverseEvent-clinical-research
Title: "Adverse Event Clinical Research"
Description: "An example profile of AdverseEvent for Research reporting."
* extension contains 
    //study-info-associated-with-AE named study-info-associated-with-AE 0..* and
    Seriousness named seriousness 1..1 and
    SeverityOrGrade named severity-or-grade 0..1 and
    expected-in-research-study named expected-in-research-study 0..1 and
    Note named note 0..*
* extension[Seriousness] ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* extension[SeverityOrGrade] ^short = "The degree of something undesirable"
* extension[expected-in-research-study] ^short = "Considered likely or probable or anticipated in the research study"
* extension[Note] ^short = "Comment on adverse event"
//what is the use case for multiple studies?
//* study 1..* MS
//cardinality issue if more than one study and expectedInResearchStudy
//should this be if any study is assoicated?
//* expectedInResearchStudy 1..1 MS
* suspectEntity.causality 1..1 MS
//* suspectEntity.extension contains study-associated named study-associated 0..1 
* actuality = http://hl7.org/fhir/adverse-event-actuality#actual
* actuality ^short = "actual"
//* subject contains ResearchSubject
* seriousness 0..0
//* expectedInResearchStudy 0..* MS contentReference http://build.fhir.org/adverseevent-definitions.html#AdverseEvent.expectedInResearchStudy "expectedInResearchStudy" "Considered likely or probable or anticipated in the research study"
* study 1..1 MS
//* outcome from http://hl7.org/fhir/R4/valueset-adverse-event-outcome.html (extensible)
//* note 0..0

Instance: ClinicalResearchAdverseEventexample1
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventexample1"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingCondition[0] = Reference(AEHepaticFailureUseCase7) "condition caused"
* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"

* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"
* extension[seriousness].extension[serious].valueBoolean = true
//* extension[seriousness].extension[seriousnessCriteria].valueCodeableConcept = seriousness-criteria-cs#requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[seriousness].extension[seriousnessCriteria].valueCodeableConcept = #requiresPreventImpairment "required intervention to prevent permanent damage"
* extension[severity-or-grade].valueCodeableConcept = http://hl7.org/fhir/R4/valueset-adverse-event-severity.html#severe "Severe"

//* extension[study-info-associated-with-AE][0].extension[studyAssociatedWithAE].valueReference.display = "NCT1010101" 
//* extension[StudyInfoassociatedWithAE][0].extension[researchSubjectAssociatedWithAE].valueReference.display = "research Subject 5"
//* extension[StudyInfoassociatedWithAE][0].extension[expectedInResearchStudy].valueBoolean = true
//* extension[StudyInfoassociatedWithAE][0].extension[AEcausedStudyDiscontinuation].valueBoolean = true
//* extension[StudyInfoassociatedWithAE][+].extension[studyAssociatedWithAE].valueReference.display = "NCT12345" 
//* extension[StudyInfoassociatedWithAE][=].extension[researchSubjectAssociatedWithAE].valueReference.display = "research Subject 50"
//* extension[StudyInfoassociatedWithAE][=].extension[expectedInResearchStudy].valueBoolean = false
//* extension[StudyInfoassociatedWithAE][=].extension[AEcausedStudyDiscontinuation].valueBoolean = true

//https://confluence.hl7.org/pages/viewpage.action?pageId=49646529#AdverseEventUseCases-UseCase7-Clinicaltrial:significantadverseevent
Instance: ClinicalResearchAdverseEventUseCase7
InstanceOf: AdverseEvent-clinical-research
Usage: #example
Title: "ClinicalResearchAdverseEventUseCase7"
Description: "example"
//* actuality = http://hl7.org/fhir/adverse-event-actuality#actual 
* status = #completed
* subject = Reference(ClinicalTrialSubject5)
* outcome = http://snomed.info/sct#405532008 "Adverse incident resulting in potentially permanent disabling damage"
//* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious
* resultingCondition[0] = Reference(AEHepaticFailureUseCase7)
* resultingCondition[1] = Reference(AEHepaticFailureUseCase7complication)
* category = http://terminology.hl7.org/CodeSystem/adverse-event-category#medication-mishap "medication-mishap"
* study.display = "NCT1010101"
* suspectEntity[0].instanceCodeableConcept.text = "Aspirin"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
* suspectEntity[+].instanceCodeableConcept.text = "Study Medication Use Case 7"
* suspectEntity[=].causality.entityRelatedness = http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess#certain "Certain"
//* suspectEntity[=].study-information
//* suspectEntity[=].extension.url
//.extension[studyAssociatedWithAE].display = "NCT1010101"
//.extension[StudyAssociatedWithAE].display = "NCT1010101"
//* suspectEntity[=].extension[StudyInfoassociatedWithAE].ResearchSubjectAssociatedWithAE.display = "NCT1010101 subject 5"
//* suspectEntity[=].extension.ExpectedInResearchStudy = true
//* suspectEntity[=].extension.AEcausedStudyDiscontinuation = true
* recorder.display = "Clinical Research Associate"
* detected = "1905-08-23"
* recordedDate = "1905-08-24"
* code = http://snomed.info/sct#370901008 "Serious reportable event associated with product or device"
* extension[seriousness].extension[serious].valueBoolean = true


Instance: AEHepaticFailureUseCase7
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#197270009 "Acute Hepatic Failure"
* clinicalStatus = #active

Instance: AEHepaticFailureUseCase7complication
InstanceOf: Condition
Usage: #example
Title: "AEHepaticFailureUseCase7complication"
Description: "The fifth subject enrolled in the trial develops severe hepatic failure complicated by encephalopathy one month after starting the study. The study sponsors determined that is an unanticipated problem that must be reported because although the risk of mild liver injury was foreseen, severe liver injury resulting in hepatic failure was unexpected in severity; possibly related to participation in the research; and serious."
* subject = Reference(ClinicalTrialSubject5)
* severity = http://snomed.info/sct#24484000 "Severe"
* code =  http://snomed.info/sct#13920009 "Hepatic encephalopathy"
* clinicalStatus = #active

