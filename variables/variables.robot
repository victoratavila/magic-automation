*** Variables ***
${BROWSER}        chromium
${HEADLESS}       False

${BASE_URL}       http://localhost:5500
${LOGIN_URL}      ${BASE_URL}/login

${VALID_EMAIL}    magic-admin@tuamaeaquelaursa.com
${VALID_PASSWORD}    12345678

${INVALID_EMAIL}  wrong@email.com
${INVALID_PASSWORD}    87645321

${NEW_PASSWORD}    12345678

${REGISTRATION_URL}    ${BASE_URL}/register