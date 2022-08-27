#permite criar um executável de tamanho menor da imagem
FROM golang:1.19 as build
#CRIA DIRETÓRIO
WORKDIR /app
#COPIA TUDO PARA O DIRETÓRIO
COPY . .

#CGO_ENABLED=0 INFORMA QUE NADA DO C SERÁ UTILIZADO NO GO
#GOOS SISTEMA OPERACIONAL
#GOARCH
RUN CGO_ENABLED=0 GOOS=linux go build -o server

FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT ["./server"]