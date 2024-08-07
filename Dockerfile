FROM alpine:latest

# Instale o Samba e suas dependências
RUN apk add --no-cache samba

# Define o Workspace
WORKDIR /samba

# Copie o arquivo de configuração do Samba
COPY smb.conf /samba/smb.conf

# Copia o diretório de compartilhamento
COPY public /samba/public

# Exibe o ls da pasta
RUN ls -la

# Copia o arquivo de configuração do Samba para o diretório de configuração
RUN cp /samba/smb.conf /etc/samba/smb.conf

# Exponha a porta do Samba
EXPOSE 445 139

# Inicie o Samba
CMD ["smbd", "-F", "--no-process-group"]
