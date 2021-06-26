import sys
import os

key_type = 'ed25519'
key_loc = f'~/.ssh/id_{key_type}'
comp_name = 'computer-os'

command = sys.argv[1]
if command == 'generate':
    os.system(f'ssh-keygen -t {key_type} -C "sanjit.bhat@gmail.com" -f {key_loc}')

if command == 'add_sys':
    os.system(f'ssh-add {key_loc}')

if command == 'add_gh':
    os.system(f'gh ssh-key add {key_loc} -t "{comp_name}"')
