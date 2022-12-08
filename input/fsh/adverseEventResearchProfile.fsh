//Extension: Note
//Id: note
//Title: "Note"
//Description: "Comments made about the adverse event by the performer, subject or other participants."
//* value[x] only Annotation

//Extension: ExpectedInResearchStudy
//Id: expected-in-research-study
//Title: "Expected In Research Study"
//Description: "Considered likely or probable or anticipated in the research study.  Whether the reported event matches any of the outcomes for the patient that are considered by the study as known or likely."
//* value[x] only boolean

Extension: SeverityOrGrade
Id: severity-or-grade
Title: "Severity Or Grade"
Description: "Describes the severity of the adverse event, in relation to the subject not the resulting condition. In the context of clinical research, it is the investigator’s assessment of severity. For cancer related trials, severity is represented as a grade."
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/R4/valueset-adverse-event-severity.html (preferred)
//http://hl7.org/fhir/ValueSet/adverse-event-severity (extensible)

Extension: CausedSubjectToDiscontinueStudy
Id: caused-subject-to-discontinue-study
Title: "Adverse event caused subject to discontinue the study"
Description: "Indicates if the subject discontinued the study due to the adverse event"
* value[x] only boolean

Extension: SeriousnessCriteria
Id: seriousness-criteria
Title: "Criteria reviewed in determining serious adverse event"
Description: "TBD - Element to capture the presence or absence of specific factors (criteria) associated with serious adverse events"
* extension contains
    criterionCode 1..1 MS and
    criterionPresent 1..1
* extension[criterionCode] ^short = "Action criteria usually associated with events that pose a threat to a patient's life or functioning"
//* extension[criterionCode] ^description = "Action criteria usually associated with events that pose a threat to a patient's life or functioning"
* extension[criterionCode].value[x] only CodeableConcept
* extension[criterionCode].valueCodeableConcept from adverse-event-seriousness-criteria-vs (extensible)
* extension[criterionCode].valueCodeableConcept 1..1

* extension[criterionPresent] ^short = "Presence or absence of the specified criteria"
//* extension[criterionPresent] ^descripton = "Boolean to indicate if the specified criteria is present or absence"
* extension[criterionPresent].value[x] only boolean
* extension[criterionPresent].value[x] 1..1


ValueSet: AdverseEventSerCrit
Id: adverse-event-seriousness-criteria-vs
Title: "Adverse Event Seriousness Criteria"
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning. Adverse Events criteria to expand on the seriousness of the adverse event. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch). The adverse event seriousness criteria value set is based on the ICH E2D Post-Approval Safety Data Management: Definitions and Standards for Expedited Reporting guidance (https://database.ich.org/sites/default/files/E2D_Guideline.pdf)."
//* codes from system seriousness-criteria-cs
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34	"resultsInDeath" //"Was the serious adverse event life-threatening?"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21	"isLifeThreatening" 
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33	"requiresInpatientHospitalization"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35	"resultsInPersistentOrSignificantDisability"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12	"congenitalAnomalyBirthDefect"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26	"otherMedicallyImportantCondition" 

ValueSet: OutcomeAEClinRes
Id: adverse-event-outcome-clinical-research-vs
Title: "Adverse Event Clinical Research Outcomes"
Description: "This value set includes codes that describe the type of outcome from the adverse event as typically used in reporting for Clinical Research, post-market surveillance (e.g. Medwatch forms). This list comes from ICH E2B R3 (https://database.ich.org/sites/default/files/E2D_Guideline.pdf), specifically CDISC CL.C66768.OUT."
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#fatal	"Fatal" //"Was the serious adverse event life-threatening?"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved	"Not recovering/not resolved" 
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#resolvedwithsequelae	"Recovered/Resolved with sequelae"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved	"Recovered/Resolved"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#roveringorresolving	"Recovering/Resolving"



//CodeSystem: SeriousnessCriteriaCS
//Id: seriousness-criteria-cs
//Title: "Seriousness Criteria Code System"
//Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning"
//* #resultsInDeath "Resulted in Death" "Adverse event resulted in death"
//* #lifeThreatening "Life Threatening" "Life Threatening"
//* #resultsinHospitalization "Resulted in Hospitalization" "Resulted in Hospitalization"
//* #resultsInDisabliity "Resulted in Disability" "Resulted in Disability"
//* #isBirthDefect "Resulted in Birth defect" "Resulted in Birth Defect"
//* #requiresPreventImpairment "Required Intervention" "Required Intervention to Prevent Permanent Impairment or Damage"

ValueSet: CausalityRelatedness
Id: adverse-event-causality-related-vs
Title: "Causality Relatedness values"
Description: "Valueset for stating if a suspected entity is Not Related, Unlikely Related, Possibly Related, or Related to the cause of the adverse event. This values are derived from the ICH"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrelated "Not Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#unlikely "Unlikely Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#related "Related"


Invariant: aeClinRes-seriousness-1
Description: "If seriousness is serious then must have at least one seriousness criterion."
Expression: "(seriousness=http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#serious AND extension[seriousness-criteria].exists()) OR seriousness=http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious"
Severity: #error
//XPath: " "


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
	CausedSubjectToDiscontinueStudy named caused-subject-to-discontinue-study 0..1 and
    SeriousnessCriteria named seriousness-criteria 0..* and
    SeverityOrGrade named severity-or-grade 0..1
//    expected-in-research-study named expected-in-research-study 0..1 and
//    Note named note 0..*

* extension[SeverityOrGrade] ^short = "The degree of something undesirable"
//* extension[expected-in-research-study] ^short = "Considered likely or probable or anticipated in the research study"
//* extension[Note] ^short = "Comment on adverse event"

* suspectEntity.causality 1..1 MS
* suspectEntity.causality.entityRelatedness from adverse-event-causality-related-vs (preferred)

* actuality = http://hl7.org/fhir/adverse-event-actuality#actual
* actuality ^short = "actual"

//* expectedInResearchStudy 0..* MS contentReference http://build.fhir.org/adverseevent-definitions.html#AdverseEvent.expectedInResearchStudy "expectedInResearchStudy" "Considered likely or probable or anticipated in the research study"

* occurrence[x] only Period
* occurrencePeriod 0..1 MS
* seriousness 1..1 MS 
* seriousness from http://hl7.org/fhir/ValueSet/adverse-event-seriousness (required)
* seriousness obeys aeClinRes-seriousness-1
* seriousness ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* outcome 1..1 MS
* outcome from adverse-event-outcome-clinical-research-vs (required)
* study 1..1 MS
* note ^short = "Comment on adverse event"


