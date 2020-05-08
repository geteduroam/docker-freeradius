FROM freeradius/freeradius-server:3.0.21-alpine
RUN rm \
	/etc/raddb/sites-available/default \
	/etc/raddb/sites-available/inner-tunnel \
	/etc/raddb/mods-enabled/eap \
	/etc/raddb/certs/ca.pem \
	/etc/raddb/certs/server.key \
	/etc/raddb/certs/server.pem \
	\
	/etc/raddb/mods-available/attr_filter \
	/etc/raddb/mods-available/files \
	/etc/raddb/mods-available/preprocess \
	/etc/raddb/mods-available/realm \
	/etc/raddb/mods-available/cache_eap \
	/etc/raddb/mods-available/chap \
	/etc/raddb/mods-available/date \
	/etc/raddb/mods-available/detail \
	/etc/raddb/mods-available/digest \
	/etc/raddb/mods-available/dynamic_clients \
	/etc/raddb/mods-available/echo \
	/etc/raddb/mods-available/exec \
	/etc/raddb/mods-available/expiration \
	/etc/raddb/mods-available/expr \
	/etc/raddb/mods-available/linelog \
	/etc/raddb/mods-available/logintime \
	/etc/raddb/mods-available/mschap \
	/etc/raddb/mods-available/ntlm_auth \
	/etc/raddb/mods-available/pap \
	/etc/raddb/mods-available/passwd \
	/etc/raddb/mods-available/radutmp \
	/etc/raddb/mods-available/replicate \
	/etc/raddb/mods-available/soh \
	/etc/raddb/mods-available/sradutmp \
	/etc/raddb/mods-available/unix \
	/etc/raddb/mods-available/unpack \
	/etc/raddb/mods-available/utf8

COPY raddb/certs /etc/raddb/certs

# Sanity check, certificates exist
RUN stat -c %n \
	/etc/raddb/certs/ca.pem \
	/etc/raddb/certs/server.key \
	/etc/raddb/certs/server.pem

COPY raddb/clients.conf /etc/raddb/clients.conf

# We just put the available mods directly in enabled
# so we can skip the symlink step
COPY raddb/mods-available /etc/raddb/mods-enabled
COPY raddb/sites-available /etc/raddb/sites-enabled
