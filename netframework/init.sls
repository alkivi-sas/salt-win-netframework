netframework-test:
  file.managed:
    - name: c:\alkivi\packages\netframework\test.ps1
    - source: salt://netframework/templates/test.ps1
    - makedirs: True

netframework-download:
  file.managed: 
    - name: c:\alkivi\packages\netframework\net-installer_4-6-2.exe
    - source: https://download.microsoft.com/download/F/9/4/F942F07D-F26F-4F30-B4E3-EBD54FABA377/NDP462-KB3151800-x86-x64-AllOS-ENU.exe
    - source_hash: md5=9a5d647ee710af2b1aede329c40bbe1a
    - makedirs: True
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\netframework\test.ps1
    - require: 
      - file: netframework-test

netframework-install:
  cmd.run: 
    - name: .\net-installer_4-6-2.exe /q /norestart
    - cwd: c:\alkivi\packages\netframework\
    - shell: powershell
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\netframework\test.ps1
    - require:
      - file: netframework-download
