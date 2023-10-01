EAPI=8

inherit acct-user

DESCRIPTION="User for Openmeat"

ACCT_USER_ID=801
ACCT_USER_GROUPS=( openmeat )

acct-user_add_deps
