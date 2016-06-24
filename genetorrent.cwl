class: CommandLineTool
label: GeneTorrent
baseCommand: [python, genetorrent.py]

requirements:
  - class: "DockerRequirement"
    dockerImageId: "opengenomics/genetorrent"

arguments:
  - valueFrom: $(inputs.uuid + ".bam")
    position: 2
  

inputs:
    - id: uuid
      type: string
      inputBinding:
        position: 1
    - id: cred
      type: [ "null", File ]
      inputBinding:
        prefix: --cred-file
    - id: endpoint
      type: string
      default: cghub.ucsc.edu
      inputBinding:
        position: 3

outputs:
    - id: bam
      type: File
      outputBinding:
        glob: $(inputs.uuid + ".bam")
      
