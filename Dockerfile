FROM freeradius/freeradius-server:3.0.21-alpine
RUN rm \
	/etc/raddb/sites-available/default \
	/etc/raddb/sites-available/inner-tunnel \
	/etc/raddb/mods-enabled/eap \
	/etc/raddb/certs/ca.pem \
	/etc/raddb/certs/server.key \
	/etc/raddb/certs/server.pem

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
