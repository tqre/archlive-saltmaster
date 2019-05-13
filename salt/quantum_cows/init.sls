'/qemu/img_create_many':
  file.managed:
    - source: salt://quantum_cows/img_create_many

'/qemu/img_create_many QUANTUM-COW':
  cmd.run

'/qemu/cows_run_free.sh':
  file.managed:
    - source: salt://quantum_cows/cows_run_free.sh


