rem esphome -q update-all . >> Buildlog.log 2>&1
rem esphome compile SmartReSpeaker.yaml 2>&1 | tee -a Buildlog.log
esphome run SmartReSpeaker.yaml 2>&1 | tee -a RunBuildlog.log
pause