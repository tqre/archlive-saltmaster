'/qemu/img_create_many COW':
  cmd.run

'/qemu/cows_run_free.sh':
  file.managed:
    - source: salt://quantum_cows/cows_run_free.sh

'/qemu/RUNMYCOWS.sh':
  file.managed:
    - source: salt://quantum_cows/RUNMYCOWS.sh

