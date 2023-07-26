
Extension: SeverityOrGrade
Id: severity-or-grade
Title: "Severity Or Grade"
Description: "Describes the severity of the adverse event, in relation to the subject not the resulting condition. In the context of clinical research, it is the investigator’s assessment of severity. For cancer related trials, severity is represented as a grade."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only CodeableConcept
* valueCodeableConcept from adverse-event-severity-or-grade-vs (preferred)
//http://hl7.org/fhir/ValueSet/adverse-event-severity (extensible)

Extension: CausedSubjectToDiscontinueStudy
Id: caused-subject-to-discontinue-study
Title: "Adverse event caused subject to discontinue the study"
Description: "Indicates if the subject discontinued the study due to the adverse event."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
* value[x] only boolean

Extension: SeriousnessCriteria
Id: seriousness-criteria
Title: "Criteria reviewed in determining serious adverse event"
Description: "TBD - Element to capture the presence or absence of specific factors (criteria) associated with serious adverse events."
* ^context.type = #element
* ^context.expression = "AdverseEvent"
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
Description: "Action criteria usually associated with serious events that pose a threat to a patient's life or functioning. Adverse Events criteria to expand on the seriousness of the adverse event. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch). The adverse event seriousness criteria value set is based on the ICH E2D Post-Approval Safety Data Management: Definitions and Standards for Expedited Reporting guidance (https://database.ich.org/sites/default/files/E2D_Guideline.pdf). For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document"
* ^status = #draft
* ^experimental = true
//* codes from system seriousness-criteria-cs
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#34	"Results In Death" //"Was the serious adverse event life-threatening?"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#21	"Is Life Threatening" 
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#33	"Requires Inpatient Hospitalization"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#35	"Results In Persistent Or Significant Disability"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#12	"Congenital Anomaly or Birth Defect"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#26	"Other Medically Important Condition" 
* fda-add-seriousness-criteria-cs#requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275	"Results In Death" //"Was the serious adverse event life-threatening?"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C84266	"Is Life Threatening" 
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83052	"Requires Inpatient Hospitalization"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C11338	"Results In Persistent Or Significant Disability"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C83117	"Congenital Anomaly or Birth Defect"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C82521	"Other Medically Important Condition" 


ValueSet: OutcomeAEClinRes
Id: adverse-event-outcome-clinical-research-vs
Title: "Adverse Event Clinical Research Outcomes"
Description: "This value set includes codes that describe the type of outcome from the adverse event as typically used in reporting for Clinical Research, post-market surveillance (e.g. Medwatch forms). NCI codes used here This list originates from the ICH E2B R3 (https://database.ich.org/sites/default/files/E2D_Guideline.pdf), specifically CDISC CL.C66768.OUT. For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document."
* ^status = #draft
* ^experimental = true
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#fatal "Fatal" //"Was the serious adverse event life-threatening?"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved" 
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#resolvedwithsequelae "Recovered/Resolved with sequelae"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveringorresolving "Recovering/Resolving"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C48275 "Fatal" //"Was the serious adverse event life-threatening?"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49494 "Not recovering/not resolved" 
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49495 "Recovered/Resolved with sequelae"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49498 "Recovered/Resolved"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C49496 "Recovering/Resolving"


ValueSet: CausalityRelatedness
Id: adverse-event-causality-related-vs
Title: "Causality Relatedness values"
Description: "Value set for stating if a suspected entity is Not Related, Unlikely Related, Possibly Related, or Related to the cause of the adverse event. Using NCI codes. The values originate with ICH. For information on ICH see https://admin.ich.org/sites/default/files/inline-files/OID_Information_Paper_1.pdf from the INTERNATIONAL CONFERENCE ON HARMONISATION OF TECHNICAL REQUIREMENTS FOR REGISTRATION OF PHARMACEUTICALS FOR HUMAN USE (ICH) document ICH E2B(R3), the Electronic Transmission of Individual Case Safety Reports (ICSRs) Implementation Guide Data Elements and Message Specification, and ICH M8, the Electronic Common Technical Document"
* ^status = #draft
* ^experimental = true
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrelated "Not Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#unlikely "Unlikely Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
//* urn:oid:2.16.840.1.113883.3.989.2.1.1.19#related "Related"

* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53256 "Not Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53257 "Unlikely Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53258 "Possibly Related"
* http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#C53260 "Related"



CodeSystem: FDAaddSeriousnessCriteriaCS
Id: fda-add-seriousness-criteria-cs
Title: "FDA Additional Seriousness Criteria CodeSystem"
Description: "Additional codes found on https://www.fda.gov/safety/reporting-serious-problems-fda/what-serious-adverse-event#:~:text=Required%20Intervention%20to%20Prevent%20Permanent%20Impairment%20or%20Damage%20(Devices),use%20of%20a%20medical%20product. Typically used in reporting for Clinical Research, post-market surveillance (e.g. Form FDA 3500A MedWatch)."
* ^status = #draft
* ^caseSensitive = true
* ^experimental = true
* #requiresPreventImpairment "Required Intervention to Prevent Permanent Impairment or Damage (Devices)" "Report if you believe that medical or surgical intervention was necessary to preclude permanent impairment of a body function, or prevent permanent damage to a body structure, either situation suspected to be due to the use of a medical product"

CodeSystem: AdverseEventSeverityOrGradeCS
Id: adverse-event-severity-or-grade-cs
Title: "AdverseEvent Severity or Grade Codes"
Description: "Hierarchical Code System for codes that indicate severity of the adverse event or grade."
* ^url = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^experimental = true
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a
* ^property[0].code = #abstract
* ^property[=].type = #boolean
* ^property[=].description = "True when the code is not intended to be used"
* ^property[+].code = #parent
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#parent"
* ^property[=].type = #code
* ^property[=].description = "The parent term of the current term"
* #severity "Severity Codes" "Grouping concept for severities"
* #severity ^property.code = #abstract
* #severity ^property.valueBoolean = true
* #grade "Grade Codes" "Grouping concept for grades"
* #grade ^property.code = #abstract
* #grade ^property.valueBoolean = true
* #1 "Mild" "An experience that is usually transient, and requires no special treatment or intervention. The event does not generally interfere with usual daily activities. Includes transient laboratory test alterations."
* #1 ^property[+].code = #parent
* #1 ^property[=].valueCode = #grade
* #1 ^property[+].code = #parent
* #1 ^property[=].valueCode = #severity
* #2 "Moderate" "An experience that is alleviated with simple therapeutic treatments. The event impacts usual daily activities. Includes laboratory test alterations indicating injury, but without long-term risk."
* #2 ^property[+].code = #parent
* #2 ^property[=].valueCode = #grade
* #2 ^property[+].code = #parent
* #2 ^property[=].valueCode = #severity
* #3 "Severe" "An adverse event experience that requires intensive therapeutic intervention and interrupts usual daily activities."
* #3 ^property[+].code = #parent
* #3 ^property[=].valueCode = #grade
* #3 ^property[+].code = #parent
* #3 ^property[=].valueCode = #severity
* #4 "Life Threatening or Disabling" "Any adverse event that places the patient, in the view of the initial reporter, at immediate risk of death from the adverse event as it occurred, i.e., it does not include an adverse experience that, had it occurred in a more severe form, might have caused death."
* #4 ^property[+].code = #parent
* #4 ^property[=].valueCode = #grade
* #5 "Death Related to Adverse Event" "The termination of life associated with an adverse event."
* #5 ^property[+].code = #parent
* #5 ^property[=].valueCode = #grade

//https://hl7.org/fhir/R4/valueset-example-hierarchical.json.html
//http://hl7.org/fhir/R4B/valueset-example-expansion.json.html
ValueSet: AdverseEventSeverityOrGrade
Id: adverse-event-severity-or-grade-vs
Title: "AdverseEvent Severity or Grade Value Set"
Description: "This value set includes codes that indicate severity of the adverse event or grade."
* ^status = #draft
* ^experimental = true
* include codes from system adverse-event-severity-or-grade-cs
//http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs
    where parent in "severity, grade"
* ^expansion.timestamp = "2022-05-22T13:56:07Z"
* ^expansion.total = 8
* ^expansion.offset = 0
* ^expansion.parameter.name = "version"
* ^expansion.parameter.valueString = "1.00"	
* ^expansion.contains[+].display = "Severity codes"
* ^expansion.contains[=].abstract = true
* ^expansion.contains[=].contains[0].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #1
* ^expansion.contains[=].contains[=].display = "Mild"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #2
* ^expansion.contains[=].contains[=].display = "Moderate"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #3
* ^expansion.contains[=].contains[=].display = "Severe"
* ^expansion.contains[+].display = "Grade codes"
* ^expansion.contains[=].abstract = true
* ^expansion.contains[=].contains[0].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #1
* ^expansion.contains[=].contains[=].display = "Mild"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #2
* ^expansion.contains[=].contains[=].display = "Moderate"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #3
* ^expansion.contains[=].contains[=].display = "Severe"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #4
* ^expansion.contains[=].contains[=].display = "Life Threatening or Disabling"
* ^expansion.contains[=].contains[+].system = "http://hl7.org/fhir/uv/ae-research-ig/CodeSystem/adverse-event-severity-or-grade-cs"
* ^expansion.contains[=].contains[=].code = #5
* ^expansion.contains[=].contains[=].display = "Death Related to Adverse Event"


Invariant: aeClinRes-seriousness-1
Description: "If seriousness is serious then must have at least one seriousness criterion."
Expression: 
"(seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='serious')
and extension('http://hl7.org/fhir/uv/ae-research-ig/StructureDefinition/seriousness-criteria').exists()
and seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='non-serious').not()
)
or
(seriousness.coding.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness'
and code='non-serious') and
seriousness.coding
.exists(system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and code='serious').not()
and
extension('http://hl7.org/fhir/uv/ae-research-ig/StructureDefinition/seriousness-criteria').exists().not()
)"

//"(AdverseEvent.seriousness.coding.system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and AdverseEvent.seriousness.coding.code='serious' and extension.where(url='http://hl7.org/fhir/uv/ae-research-ig/StructureDefinition/seriousness-criteria').exists()) or (AdverseEvent.seriousness.coding.system='http://terminology.hl7.org/CodeSystem/adverse-event-seriousness' and AdverseEvent.seriousness.coding.code='non-serious')"
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

* obeys aeClinRes-seriousness-1

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

* suspectEntity.causality.assessmentMethod ^short = "Method of evaluating the relatedness of the suspected entity to the event."
* suspectEntity.causality.assessmentMethod from http://hl7.org/fhir/ValueSet/adverse-event-causality-method (preferred)
* suspectEntity.causality.assessmentMethod ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* suspectEntity.causality.assessmentMethod ^binding.extension.valueString = "AdverseEventCausalityMethod"
* suspectEntity.causality.assessmentMethod ^binding.description = "Codes for the method of evaluating the relatedness of the suspected entity to the event, such as ProbabilityScale | Bayesian | Checklist."


* actuality = http://hl7.org/fhir/adverse-event-actuality#actual
* actuality ^short = "actual"

//* expectedInResearchStudy 0..* MS contentReference http://build.fhir.org/adverseevent-definitions.html#AdverseEvent.expectedInResearchStudy "expectedInResearchStudy" "Considered likely or probable or anticipated in the research study"

* occurrence[x] only Period
* occurrencePeriod 0..1 MS
* seriousness 1..1 MS 
* seriousness from http://hl7.org/fhir/ValueSet/adverse-event-seriousness (required)
//* seriousness obeys aeClinRes-seriousness-1
* seriousness ^short = "Investigator defined severity of the adverse event, in relation to the subject not the resulting condition"
* outcome 1..1 MS
* outcome from adverse-event-outcome-clinical-research-vs (required)
* study 1..1 MS

* supportingInfo.item[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* supportingInfo.item[x] ^binding.extension.valueString = "Adverse Event Supporting Info"

* preventiveAction 0..0

* note ^short = "Comment on adverse event"

* resultingEffect ^definition = "Information about the condition that occurred as a result of the adverse event."


