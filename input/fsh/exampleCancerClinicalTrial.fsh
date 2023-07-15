// Cancer clinical trial example (narrative provided by Alliance), ideally this would use mCODE profiles for cancer condition and cancer medications
Instance: patient-example-kaitlyn-b
InstanceOf: Patient
Description: "Compass Trial example patient Kaitlyn"
* identifier.use = #usual
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#MR "Medical Record Number"
* identifier.system = "http://hospital.example.org"
* identifier.value = "m123"
* name.family = "Bounce"
* name.given[0] = "Kaitlyn"
* contact.telecom[0].system = #phone
* contact.telecom[0].value = "545-123-4560"
* contact.telecom[0].use = #home
* contact.telecom[1].system = #email
* contact.telecom[1].value = "kaitlynb@example.com"
* gender = #female
* birthDate = "1985-02-20"
* address.line = "123 Main St"
* address.city = "Anytown"
* address.postalCode = "12345"
* address.country = "US"
* communication.language = urn:ietf:bcp:47#en-US "English (Region=United States)"
* communication.language.text = "English"

Instance: practitioner-oncology-nurse-jane
InstanceOf: Practitioner
Description: "Example RN practitioner"
* name.family = "Nurse"
* name.given[0] = "Jane"
* name.prefix[0] = "Ms."
* address.use = #work
* address.line[0] = "123 Corporate Drive"
* address.city = "Anytown"
* address.state = "MA"
* address.postalCode = "12345"
* address.country = "US"
* gender = #female
* qualification.code = http://terminology.hl7.org/CodeSystem/v2-0360#RN
//* qualification.code.coding[0].version = "2.7"

Instance: practitioner-owen-oncologist
InstanceOf: Practitioner
Description: "Example Oncologist"
* name.family = "Oncologist"
* name.given[0] = "Owen"
* name.prefix[0] = "Dr."
* address.use = #work
* address.line[0] = "123 Corporate Drive"
* address.city = "Anytown"
* address.state = "MA"
* address.postalCode = "12345"
* address.country = "US"
* gender = #male
* qualification.code = http://terminology.hl7.org/CodeSystem/v2-0360#MD
//* qualification.code.coding[0].version = "2.7"

Instance: medication-request-example-kadcyla
InstanceOf: MedicationRequest
Description: "Example showing clinical trial medication Kadcyla"
* status = #active "active"
* intent = #order
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#1371046 "KADCYLA"
* subject = Reference(patient-example-kaitlyn-b)
* requester = Reference(practitioner-owen-oncologist)
//* reasonReference = Reference(kaitlyn-primary-cancer-condition-ex1)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-04-01"
* authoredOn = "2020-03-12"
* dosageInstruction.text = "Kadcyla IV at 3.6mg"
* dosageInstruction.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"
* dosageInstruction.doseAndRate.rateQuantity = 3.6 'mg' "mg"
// Once every 21 days
* dosageInstruction.maxDosePerAdministration.value = 1

Instance: medication-request-example-tucatinib
InstanceOf: MedicationRequest
Description: "Example showing clinical trial medication Tucatinib"
//* extension[treatmentIntent].valueCodeableConcept = SCT#373808002 "Curative - procedure intent (qualifier value)"
* status = #active "active"
* intent = #order
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#2361290 "tucatinib 150 MG Oral Tablet"
* subject = Reference(patient-example-kaitlyn-b)
* requester = Reference(practitioner-owen-oncologist)
//* reasonReference = Reference(kaitlyn-primary-cancer-condition-ex1)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-04-01"
* authoredOn = "2020-03-12"
* dosageInstruction.text = "oral twice a day every day"
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
* dosageInstruction.doseAndRate.rateQuantity = 150 'MG' "MG"
// twice a day every day
* dosageInstruction.maxDosePerAdministration.value = 2

Instance: medication-administration-kadcyla
InstanceOf: MedicationAdministration
Description: "Example showing clinical trial medication adminstration Kadcyla"
* status = #completed "completed"
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#1371046 "KADCYLA"
* subject = Reference(patient-example-kaitlyn-b)
* performer.actor.reference = Reference(practitioner-oncology-nurse-jane)
//* reasonReference = Reference(kaitlyn-primary-cancer-condition-ex1)
* request = Reference(medication-request-example-kadcyla)
* occurenceDateTime = "2020-04-01"
* note.authorReference = Reference(practitioner-oncology-nurse-jane)
* note.time = "2020-04-01"
* note.text = "3.6mg administered by continuous infusion. Patient tolerated infusion without side effects."
* dosage.dose = 3.6 'mg' "mg"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"

Instance: medication-administration-tucatinib
InstanceOf: MedicationAdministration
Description: "Example showing clinical trial medication adminstration Tucatinib"
* status = #completed "completed"
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#2361290 "tucatinib 150 MG Oral Tablet"
* subject = Reference(patient-example-kaitlyn-b)
* performer.actor.reference = Reference(practitioner-oncology-nurse-jane)
//* reasonReference = Reference(kaitlyn-primary-cancer-condition-ex1)
* request = Reference(medication-request-example-tucatinib)
* occurenceDateTime = "2020-04-01"
* note.authorReference = Reference(practitioner-oncology-nurse-jane)
* note.time = "2020-04-01"
* note.text = "Patient took 2 tablets"
* dosage.dose = 300 'MG' "MG"
* dosage.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"

Instance: clinical-trial-example-compass
InstanceOf: ResearchStudy
Description: "Alliance COMPASS Protocol A011801"
* title = "Alliance COMPASS Trial A011801" 
* status =  http://hl7.org/fhir/research-study-status#active "Active"

Instance: clinical-trial-example-subject
InstanceOf: ResearchSubject
Description: "Alliance COMPASS trial research subject"
* identifier[0].use = #usual
* identifier[=].value = "ABC2134"
* status = #active
* progress.type = http://terminology.hl7.org/CodeSystem/research-subject-state-type#Enrollment "Enrollment status"
* progress.subjectState = http://terminology.hl7.org/CodeSystem/research-subject-state#on-study "On-study"
* study = Reference(clinical-trial-example-compass)
* subject = Reference(patient-example-kaitlyn-b)

// mitigating action 
// Kadcyla was dose reduced to 3.0mg and 
// Tucatinib was also dose reduced to 250mg twice daily per dose 
Instance: medication-administration-kadcyla-reduced
InstanceOf: MedicationAdministration
Description: "Example reduced dose of clinical trial medication adminstration Kadcyla"
* status = #completed "completed"
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#1371046 "KADCYLA"
* subject = Reference(patient-example-kaitlyn-b)
* performer.actor.reference = Reference(practitioner-oncology-nurse-jane)
* request = Reference(medication-request-example-kadcyla)
* occurenceDateTime = "2020-05-20"
* note.authorReference = Reference(practitioner-oncology-nurse-jane)
* note.time = "2020-05-20"
* note.text = "reduced dose of 3.0mg administered by continuous infusion. Patient tolerated infusion without side effects."
* dosage.dose = 3.0 'mg' "mg"
* dosage.route = http://snomed.info/sct#47625008 "Intravenous route (qualifier value)"

Instance: medication-administration-tucatinib-reduced
InstanceOf: MedicationAdministration
Description: "Example reduced does of clinical trial medication adminstration Tucatinib"
* status = #completed "completed"
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#2361290 "tucatinib 150 MG Oral Tablet"
* subject = Reference(patient-example-kaitlyn-b)
* performer.actor.reference = Reference(practitioner-oncology-nurse-jane)
* request = Reference(medication-request-example-tucatinib)
* occurenceDateTime = "2020-05-20"
* note.authorReference = Reference(practitioner-oncology-nurse-jane)
* note.time = "2020-05-20"
* note.text = "Patient took 1 tablet 2x daily"
* dosage.dose = 250 'MG' "MG"
* dosage.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"

Instance: adverse-event-compass-ex1
InstanceOf: AdverseEvent-clinical-research
Description: "Grade 1 ALT"
* subject = Reference(patient-example-kaitlyn-b)
* status = #in-progress
* code = http://terminology.hl7.org/CodeSystem/MDRAE#10001551  "Alanine aminotransferase increased" 
* code.text = "Alanine aminotransferase (ALT) increased at 50"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#1 "Mild"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved"
* occurrencePeriod.start = "2020-04-22"
* recorder = Reference(practitioner-oncology-nurse-jane)
* participant[0].function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#AUTHEN 
* participant[=].actor = Reference(practitioner-owen-oncologist)
* study = Reference(clinical-trial-example-compass)
//* extension[research-subject-ref].valueReference = Reference(clinical-trial-example-subject)
* suspectEntity[0].instanceReference = Reference(medication-administration-kadcyla)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* suspectEntity[+].instanceReference = Reference(medication-administration-tucatinib)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* expectedInResearchStudy = true

Instance: adverse-event-compass-ex1a
InstanceOf: AdverseEvent-clinical-research
Description: "Grade 3 ALT"
* subject = Reference(patient-example-kaitlyn-b)
* status = #in-progress
* code = http://terminology.hl7.org/CodeSystem/MDRAE#10001551  "Alanine aminotransferase increased" 
* code.text = "Alanine aminotransferase (ALT) increased to 200"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#3 "Severe"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved"
* occurrencePeriod.start = "2020-05-13"
* recorder = Reference(practitioner-oncology-nurse-jane)
* participant[0].function = ParticipationType#AUTHEN 
* participant[=].actor = Reference(practitioner-owen-oncologist)
* study = Reference(clinical-trial-example-compass)
//* extension[research-subject-ref].valueReference = Reference(clinical-trial-example-subject)
* suspectEntity[0].instanceReference = Reference(medication-administration-kadcyla)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* suspectEntity[+].instanceReference = Reference(medication-administration-tucatinib)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* expectedInResearchStudy = true
* note[0].text = "treatment held today per protocol guidelines and the patient was scheduled to return in one week for repeat lab work"
// treatment held, but don't know how to document this as preventative action

Instance: adverse-event-compass-ex1b
InstanceOf: AdverseEvent-clinical-research
Description: "ALT back to grade 1 and resolved"
* subject = Reference(patient-example-kaitlyn-b)
* status = #completed
* code = http://terminology.hl7.org/CodeSystem/MDRAE#10001551  "Alanine aminotransferase increased" 
* code.text = "Alanine aminotransferase (ALT) decreased to 60"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#1 "Mild"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#recoveredorresolved "Recovered/Resolved"
* occurrencePeriod.start = "2020-05-20"
* recorder = Reference(practitioner-oncology-nurse-jane)
* participant[0].function = ParticipationType#AUTHEN 
* participant[=].actor = Reference(practitioner-owen-oncologist)
* study = Reference(clinical-trial-example-compass)
//* extension[research-subject-ref].valueReference = Reference(clinical-trial-example-subject)
* suspectEntity[0].instanceReference = Reference(medication-administration-kadcyla)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* suspectEntity[+].instanceReference = Reference(medication-administration-tucatinib)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* expectedInResearchStudy = true
* occurrencePeriod.end = "2020-06-10"
* note[0].text = "treatment given with reduced dose per protocol guidelines"
* mitigatingAction[0].itemReference = Reference(medication-administration-kadcyla-reduced)
* mitigatingAction[+].itemReference = Reference(medication-administration-tucatinib-reduced)

// mitigating action
//Additional antiemetics were prescribed on 6/10/20 (Zofran 8mg orally every 6-8 hours as needed).
Instance: medication-request-example-zofran
InstanceOf: MedicationRequest
Description: "Example for medication Zofran"
* status = #active "active"
* intent = #order
* medication.concept = http://www.nlm.nih.gov/research/umls/rxnorm#66981 "Zofran"
* subject = Reference(patient-example-kaitlyn-b)
* requester = Reference(practitioner-oncology-nurse-jane)
* dosageInstruction.timing.repeat.boundsPeriod.start = "2020-06-10"
* authoredOn = "2020-06-10"
* dosageInstruction.text = "orally every 6-8 hours as needed"
* dosageInstruction.route = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
* dosageInstruction.doseAndRate.rateQuantity = 8 'mg' "mg"
* dosageInstruction.maxDosePerAdministration.value = 4

Instance: adverse-event-compass-ex2
InstanceOf: AdverseEvent-clinical-research
Description: "Grade 1 Nausea/vomiting"  // both are AEs, which to use or make them separate?
* subject = Reference(patient-example-kaitlyn-b)
* status = #completed
* code = http://terminology.hl7.org/CodeSystem/MDRAE#10028813  "Nausea" 
* code.text = "Nausea"
* extension[severity-or-grade].valueCodeableConcept = $ae-severity-or-grade-cs#1 "Mild"
* seriousness = http://terminology.hl7.org/CodeSystem/adverse-event-seriousness#non-serious "Non-serious"
* outcome = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#notrecoveredorresolved "Not recovering/not resolved" 
// resolved on 6/10/20 after 3 more visits - goes to grade 3 then back to 1 then WNL
* occurrencePeriod.start = "2020-05-25"
* recorder = Reference(practitioner-oncology-nurse-jane)
* participant[0].function = ParticipationType#AUTHEN 
* participant[=].actor = Reference(practitioner-owen-oncologist)
* study = Reference(clinical-trial-example-compass)
//* extension[research-subject-ref].valueReference = Reference(clinical-trial-example-subject)
* suspectEntity[0].instanceReference = Reference(medication-administration-kadcyla)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* suspectEntity[+].instanceReference = Reference(medication-administration-tucatinib)
* suspectEntity[=].causality.entityRelatedness = urn:oid:2.16.840.1.113883.3.989.2.1.1.19#possibly "Possibly Related"
* expectedInResearchStudy = true
* occurrencePeriod.end = "2021-01-21"
* mitigatingAction[+].itemReference = Reference(medication-request-example-zofran)
