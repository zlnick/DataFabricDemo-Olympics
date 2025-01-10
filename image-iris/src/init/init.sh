
iris session $ISC_PACKAGE_INSTANCENAME -U %SYS <<- EOF

// Disable user password expiration as a demo platform
zn "%SYS"
do ##class(Security.Users).UnExpireUserPasswords("*")

// Install staging area
set stagingSpace = "STAGINGAREA"
zn "HSLIB"
// Install a Foundation namespace
Do ##class(HS.Util.Installer.Foundation).Install(stagingSpace)

halt
EOF

echo ""
echo "FHIR Server installation complete."
echo ""

iris stop $ISC_PACKAGE_INSTANCENAME quietly

exit 0