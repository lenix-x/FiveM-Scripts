local success, msg = lib.checkDependency("ox_lib", "3.17.0")
if not success then error(msg) end
lib.versionCheck("aka-lucifer/ff_shoprobbery")