## Background

Adverse Event (AE) data capture and standardization is a challenge in real world data systems. There are variations in the definitions, workflows, and data requirements across the use cases for patient monitoring, clinical intervention, regulatory safety reporting requirements and clinical trials monitoring.

The [Vulcan Adverse Event project](<https://confluence.hl7.org/display/VA/Adverse+Events>) was initiated in October 2021 to model the data elements to support the workflow for collecting and reporting serious and non-serious AEs in clinical research to meet the need of regulatory requirements. The goal of this project is to leverage Electronic Health Records (EHR) and other types of real-world data (RWD), such as Personal Health Records (PHR), as electronic source to collect adverse events that occur during clinical trials. In this project, the team leveraged the HL7 FHIR standard identifying gaps between data elements in EHRs, clinical research artifacts. and other existing standards such as:

* [FDA E2B(R3) Electronic Transmission of Individual Case Safety Reports Implementation Guide](<https://www.fda.gov/regulatory-information/search-fda-guidance-documents/e2br3-electronic-transmission-individual-case-safety-reports-implementation-guide-data-elements-and>)
* [CDISC FHIR Mapping to AE](<http://hl7.org/fhir/uv/cdisc-mapping/ae.html>)
* [ICH Harmonised Tripartite Guideline Clinical Safety Data Management: Definitions and Standards for Expedited Reporting E2A](<https://database.ich.org/sites/default/files/E2A_Guideline.pdf>)
* [Clinical Data Acquisition Standards Harmonization Implementation Guide for Human Clinical Trials Version 2.2 (Final)](<https://www.cdisc.org/standards/foundational/cdash>)
* [FDA Safety Reporting Requirements for investigational new drug (IND) and bioavailability (BA) and bioequivalence (BE) studies under 21 CFR 312.32, 312.64(b), and 320.31(d)(3).](<https://www.fda.gov/files/drugs/published/Safety-Reporting-Requirements-for-INDs-%28Investigational-New-Drug-Applications%29-and-BA-BE-%28Bioavailability-Bioequivalence%29-Studies.pdf>)
* [MedWatch the FDA safety information and adverse event reporting program](<https://www.fda.gov/safety/medwatch-fda-safety-information-and-adverse-event-reporting-program/reporting-serious-problems-fda>)

## Workflow

This IG will allow clinical trial AE representation in systems, including EHRs and PHRs, transmitted via FHIR to other systems; removing the need to transcribe AE data into secondary clinical trial management systems and improving efficiency for health authority reporting. The following workflows are examples to demonstrate the potential use of this AE profile in the clinical research spectrum via FHIR.

### Pre-Market

The following image shows a notional workflow for collecting and reporting adverse events and serious adverse events (SAE) for pre-market clinical trials. The dotted line represents a future vision of data flow using FHIR which will most likely be covered by a separate MedWatch IG that builds upon this IG.

<img src="ClinicalResearchAEScope-PreMarket-v2.png" alt="Clinical Research AE Pre-Market" width="50%" style="float:none; margin: 0px 0px 0px 0px;" />

Example scenarios: Pre-market clinical trial reporting of serious adverse events (SAE) using FHIR and utilized as part of clinical decision support actions within a clinical research trial setting.

* Adverse event is captured in EHR by Clinical Investigator and sent to Clinical Trial Management System, then sent to Sponsor or FDA.
* Patient records adverse event in a patient facing FHIR app that contains the MedWatch 3500B questionnaire. The data is sent from the patient FHIR app to the Clinical Investigator or Sponsor for inclusion in their reporting to the FDA.

### Post-Market

The following image shows a notional workflow for collecting and reporting adverse events, post-market. The dotted line represents a future vision of data flow using FHIR which will most likely be covered by a separate MedWatch IG that builds upon this IG.

<img src="ClinicalResearchAEScope-PostMarket-v2.png" alt="Clinical Research AE Post-Market" width="50%" style="float:none; margin: 0px 0px 0px 0px;" />

Example scenarios: Post-market reporting of adverse events using FHIR for longitudinal safety surveillance.

* Patient records adverse event that is sent to FDA
* Provider records adverse event in EHR that is sent to FDA
* Manufacturer (via call center) records adverse event and sends to FDA
