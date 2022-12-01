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

Extension: InstanceCodeableConcept
Id: instance-codeable-concept
Title: "Severity Or Grade"
Description: "Codeable concept for the specific entity that caused the adverse event."
* value[x] only CodeableConcept

Extension: Status
Id: status
Title: "Workflow Status"
Description: "The current workflow state of the adverse event or potential adverse event. This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."
* value[x] only code
* valueCode from adverse-event-status-vs (required)


//AdverseEvent.supportingMedicationInfo
//MedicationAdministration | MedicationStatement
Extension: SupportingMedicationInfo
Id: supporting-medication-info
Title: "Additional information regarding medications the subject is taking"
Description: "Provides references to medications the subject has been prescribed for additional context. These should be medications that are not suspected or considered as potential suspects for the adverse event. For example, a patient who became nauseous after eating a study drug that was not meant to be taken orally. This element could indicate that the patient was using topical acne medication."
* value[x] only Reference(MedicationStatement)


//AdverseEvent.contributingFactor
Extension: ContributingFactor
Id: contributing-factor
Title: "Contributing Factor"
Description: "The contributing factors suspected to have increased the probability or severity of the adverse event."
* extension contains
    id 0..1 and
    item 1..1
* extension[id].value[x] only string
* extension[id] ^representation = #xmlAttr
* extension[id] ^short = "Unique id for inter-element referencing. Any string value without spaces"
//* extension[id] ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces."

* extension[item].value[x] only CodeableConcept or Reference(Condition or Observation or AllergyIntolerance or FamilyMemberHistory or Immunization or Procedure or Device or DocumentReference or MedicationAdministration)
* extension[item].valueCodeableConcept from adverse-event-contributing-factor-vs (example)
* extension[item] ^short = "Item suspected to have increased the probability or severity of the adverse event"
//* contributingFactor.item[x] ^definition = "The item that is suspected to have increased the probability or severity of the adverse event."

* extension[item] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item] ^binding.extension.valueString = "AdverseEventContributingFactor"
* extension[item] ^binding.description = "Codes describing the contributing factors suspected to have increased the probability or severity of the adverse event."


//AdverseEvent.preventiveAction
Extension: PreventiveAction
Id: preventive-action
Title: "Preventive Action"
Description: "Preventive actions that contributed to avoiding the adverse event."
* extension contains
    id 0..1 and
    item 1..1
* extension[id].value[x] only string
* extension[id] ^representation = #xmlAttr
* extension[id] ^short = "Unique id for inter-element referencing. Any string value without spaces"
//* extension[id] ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces."

* extension[item].value[x] only CodeableConcept or Reference(Immunization or Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
* extension[item].valueCodeableConcept from adverse-event-preventive-action-vs (example)
* extension[item] ^short = "Action that contributed to avoiding the adverse event"

* extension[item] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item] ^binding.extension.valueString = "AdverseEventPreventiveAction"
* extension[item] ^binding.description = "Codes describing the preventive actions that contributed to avoiding the adverse event."

//AdverseEvent.mitigatingAction
Extension: MitigatingAction
Id: mitigating-action
Title: "Mitigating Action"
Description: "Ameliorating actions taken after the adverse event occured in order to reduce the extent of harm"
* extension contains
    id 0..1 and
    item 1..1
* extension[id].value[x] only string
* extension[id] ^representation = #xmlAttr
* extension[id] ^short = "Unique id for inter-element referencing. Any string value without spaces"
//* extension[id] ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces."

* extension[item].value[x] only CodeableConcept or Reference(Procedure or DocumentReference or MedicationAdministration or MedicationRequest)
* extension[item].valueCodeableConcept from adverse-event-mitigating-action-vs (example)
* extension[item] ^short = "Ameliorating action taken after the adverse event occured in order to reduce the extent of harm"

* extension[item] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[item] ^binding.extension.valueString = "AdverseEventMitigatingAction"
* extension[item] ^binding.description = "Codes describing the ameliorating actions taken after the adverse event occured in order to reduce the extent of harm."



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
//* extension[criterionPresent] ^description = "Boolean to indicate if the specified criteria is present or absence"
* extension[criterionPresent].value[x] only boolean
* extension[criterionPresent].value[x] 1..1


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

ValueSet: AdverseEventStatus
Id: adverse-event-status-vs
Title: "Adverse Event Status"
Description: "Codes identifying the lifecycle stage of an adverse event."
* EventStatus#in-progress
* EventStatus#completed
* EventStatus#entered-in-error
* EventStatus#unknown

ValueSet: AdverseEventType
Id: adverse-event-type-vs
Title: "AdverseEvent Type"
Description: "This value set includes codes that describe the adverse event or incident that occurred or was averted."
* ^status = #draft
* ^experimental = true
* include codes from system SNOMED_CT where concept is-a #370894009
* SNOMED_CT#1912002

ValueSet: AdverseEventContributingFactor
Id: adverse-event-contributing-factor-vs
Title: "AdverseEvent Contributing Factor"
Description: "This value set includes codes that describe the contributing factors suspected to have increased the probability or severity of the adverse event."
* ^status = #draft
* ^experimental = true
* ^copyright = "This resource includes content from SNOMED Clinical Terms® (SNOMED CT®) which is copyright of the International Health Terminology Standards Development Organisation (IHTSDO). Implementers of these specifications must have the appropriate SNOMED CT Affiliate license - for more information contact http://www.snomed.org/snomed-ct/get-snomed-ct or info@snomed.org"
* include codes from system SNOMED_CT where concept is-a #609328004
* include codes from system SNOMED_CT where concept is-a #416471007
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #404684003
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventPreventiveAction
Id: adverse-event-preventive-action-vs
Title: "AdverseEvent Preventive Action"
Description: "This value set includes codes that describe the preventive actions that contributed to avoiding the adverse event."
* ^status = #draft
* ^experimental = true
* include codes from system SNOMED_CT where concept is-a #425457005
* include codes from system SNOMED_CT where concept is-a #365861007
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

ValueSet: AdverseEventMitigatingAction
Id: adverse-event-mitigating-action-vs
Title: "AdverseEvent Mitigating Action"
Description: "This value set includes codes that describe the ameliorating actions taken after the adverse event occured in order to reduce the extent of harm."
* ^status = #draft
* ^experimental = true
* include codes from system SNOMED_CT where concept is-a #71388002
* include codes from system SNOMED_CT where concept is-a #410942007
* include codes from system SNOMED_CT where concept is-a #373873005
* include codes from system SNOMED_CT where concept is-a #106181007

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
    SeverityOrGrade named severity-or-grade 0..1 and
    expected-in-research-study named expected-in-research-study 0..1 and
    Note named note 0..* and
	Status named status 1..1 ?! SU and
	SupportingMedicationInfo named supporting-medication-info 0..*

* extension[SeverityOrGrade] ^short = "The degree of something undesirable"
* extension[expected-in-research-study] ^short = "Considered likely or probable or anticipated in the research study"
* extension[Note] ^short = "Comment on adverse event"

* extension[Status] ^short = "in-progress | completed | entered-in-error | unknown"
* extension[Status] ^definition = "The current state of the adverse event or potential adverse event."
* extension[Status] ^comment = "This is not the reporting of the event to any regulatory or quality organization.  This is not the outcome of the patient's condition."

* extension[Status] ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* extension[Status] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* extension[Status] ^binding.extension.valueString = "AdverseEventStatus"
* extension[Status] ^binding.description = "Codes identifying the lifecycle stage of an event."

* event 0..1 SU
* event from adverse-event-type-vs (example)
* event ^short = "Event or incident that occurred or was averted"
* event ^definition = "Specific event that occurred or that was averted, such as patient fall, wrong organ removed, or wrong blood transfused."
* event ^isModifier = false
* event ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* event ^binding.extension.valueString = "AdverseEventType"
* event ^binding.description = "Detailed type of event."

* suspectEntity.extension contains InstanceCodeableConcept named instance-codeable-concept 0..1
* suspectEntity.causality 1..1 MS
* suspectEntity.causality.productRelatedness 0..0
//* suspectEntity.causality.entityRelatedness from adverse-event-causality-related-vs (preferred)
* suspectEntity.causality.assessment from adverse-event-causality-related-vs (preferred)

* actuality = http://hl7.org/fhir/adverse-event-actuality#actual
* actuality ^short = "actual"

//* expectedInResearchStudy 0..* MS contentReference http://build.fhir.org/adverseevent-definitions.html#AdverseEvent.expectedInResearchStudy //"expectedInResearchStudy" "Considered likely or probable or anticipated in the research study"

//* occurrence[x] only Period
//* occurrencePeriod 0..1 MS
* seriousness 1..1 MS 
* seriousness from http://hl7.org/fhir/ValueSet/adverse-event-seriousness (required)
* seriousness obeys aeClinRes-seriousness-1
* seriousness ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* outcome 1..1 MS
* outcome from adverse-event-outcome-clinical-research-vs (required)
* study 1..1 MS





