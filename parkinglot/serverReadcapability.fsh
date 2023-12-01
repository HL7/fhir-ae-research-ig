Instance: base-level-server
InstanceOf: CapabilityStatement
Usage: #definition
* name = "BaseAEClinicalResCapabilityStatement"
* title = "Base AdverseEvent Clinical Research Profile Capability Statement"
* status = #draft
* date = "2023-07-20"
* experimental = true
* description = "This is a starting point requirements capability statement for the AdverseEvent Clinical Research Profile. It is expected that specific use cases will lead to further specification in derived IGs."
* kind = #requirements
* fhirVersion = #5.0.0
* format[0] = #json
* format[+] = #xml
* implementationGuide[0] = "http://hl7.org/fhir/uv/ae-research-ig/ImplementationGuide/hl7.fhir.uv.ae-research-ig"
* rest.mode = #server
* rest.resource[0].type = #AdverseEvent
* rest.resource[=].supportedProfile = "http://hl7.org/fhir/uv/ae-research-ig/StructureDefinition/AdverseEvent-clinical-research"
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read