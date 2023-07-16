### Intent
The intent of this guide is to provide a profile on the FHIR AdverseEvent Resource suitable for Clinical Research.

### Overview
A single Adverse Event (AE) may need to be reported in multiple ways. Choosing the appropriate form of the reporting is dependent upon workflow patterns. In particular, the implementation guides for Clinical Care adverse events and Clinical Research adverse events provide important extensions, value-sets and examples for implementing AdverseEvent.

This guide, the Clinical Research adverse event implementation guide, is for the clinical research setting. In this setting, the event is tracked and evaluated as part of the clinical research process for the research study.

In the research setting an adverse event is the result of an intervention that caused unintentional harm to a specific subject or group of subjects (this is surfaced in the profile as a constraint of ‘actual’ for the value of ‘actuality’). An example of an adverse event in the clinical research setting would be a patient develops renal failure while on a study drug. These events are characterized by the need to capture cause-and-effect (although they might not be known at the time of the event), severity, and outcome.

The context of an adverse event is also important, and captured in the AdverseEvent Clinical Research Profile data elements. A subject may have condition(s) or current treatments (medications, diet, devices) that impact their response to a newly introduced medication, device or procedure. Knowledge of these variables is essential in establishing a cause-and-effect relationship for an adverse event. This information is represented with corresponding resources (e.g. Procedure Resource for procedures, etc.) and referenced.

A potential adverse event may also be called a near miss or an error, these are not reported with the AdverseEvent Clinical Research Profile.

### Scope
This FHIR IG enables the collection of adverse events in real-world data (RWD) sources such as electronic health records (EHR) and personal health records (PHR) that occur during clinical trials. It ensures the appropriate AE representation required to support clinical research trials within a regulated environment. As the AEs are collected in RWD sources, the data can be transmitted via FHIR to clinical trial management systems, regulatory agencies, sponsors, and clinical research organizations for further processing and reporting.

In the pre-market clinical research setting, serious adverse events must be reported to the sponsor, clinical research organization, and regulatory agencies within a specific time frame for Institutional Review Boards (IRBs) and Data Safety Monitoring Board (DSMB) review. By using this IG, a clinical investigator can document an AE in the EHR, it can be received by a secondary clinical trial management system for triage and then forwarded to the sponsor and regulatory agencies. Similarly, a patient on a clinical trial can record an adverse event in their PHR that is then shared with the clinical investigator and reported to the sponsor and regulatory agencies as necessary. In a post-market situation, a patient, provider, or manufacturer can record the adverse event in a system and then report it to the FDA as a FHIR based MedWatch form.

Within this guide are several examples. Every effort has been made to capture the most important details of the use of the AdverseEvent profile. However, some examples may provide only a stub to referenced resources (e.g. instances of Patient Resource will be referenced using logical ids but are not resolvable, implementation of Patient is left for other guidance and is not the subject of this guide). Connectathons are ideal opportunities to create, compare and consider the holistic implementation of all FHIR Resources.
