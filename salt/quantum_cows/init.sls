'/qemu/img_create_many':
  file.managed:
    - source: salt://quantum_cows/img_create_many

'/qemu/cows_run_free.sh':
  file.managed:
    - source: salt://quantum_cows/cows_run_free.sh

'/qemu/vm_start':
  file.managed:
    - source: salt://quantum_cows/vm_start

scripts-executable:
  cmd.script:
    - source: salt://quantum_cows/makeexec.sh

'/qemu/img_create_many QUANTUM-COW':
  cmd.run
