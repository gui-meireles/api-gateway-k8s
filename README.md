# Kong e k8s

### O que é Kubernetes Ingress ?

É a maneira de _**realizar a exposição de rotas**_ **HTTP** e **HTTPS** para fora do cluster. Este roteamento de tráfego é controlado
por regras definidas dentro do recurso Ingress do k8s.

O **Kong Ingress Controller** é uma implementação do Kong que **atua como um controlador de Ingress para o Kubernetes**,
permitindo que você **configure facilmente regras de roteamento de tráfego** para seus serviços do k8s.

Em resumo, o Kong Ingress Controller **facilita a integração** do Kong com o Kubernetes, permitindo um gerenciamento mais
eficiente do tráfego de entrada para os serviços dentro do cluster.

![img.png](readme_images/img.png)

### Modelo de deployment via banco de dados (Não recomendado)

No modelo de deployment via banco de dados no Kong API, as configurações do Kong são armazenadas no **banco
de dados** em vez de serem definidas diretamente nos arquivos de configuração.
> O fluxo de configuração são as setas vermelhas e as setas verdes são o fluxo de cliente
![img_1.png](readme_images/img_1.png)

### Modelo de deployment via db-less (Recomendado)
![img_2.png](readme_images/img_2.png)

---

## Instalação

Itens necessários:

- kind;
- kubectl;
- helm v3;

### Com os programas acima instalados...

Caso esteja no Windows, execute os comandos abaixo com o Git Bash.

**Vamos subir o Cluster:**

Abra o seu terminal na pasta `infra/kong-k8s/kind` e execute o comando: `./kind.sh`.

E com o comando: `kubectl get pods -A`, você poderá ver os pods do kind subiram.

**Vamos subir o Kong:**

Abra o seu terminal na pasta `infra/kong-k8s/kong` e execute o comando: `./kong.sh`.

E com o comando: `kubectl get pods -n kong`, você poderá ver se os pods do kong subiram.

**Vamos subir o Prometheus:**

Abra o seu terminal na pasta `infra/kong-k8s/misc/prometheus` e execute o comando: `./prometheus.sh`.

E com o comando: `kubectl get pods -n monitoring`, você poderá ver se os pods do prometheus subiram.

**Vamos subir o KeyCloak:**

Abra o seu terminal na pasta `infra/kong-k8s/misc/keycloak` e execute o comando: `./keycloak.sh`.

E com o comando: `kubectl get pods -n iam`, você poderá ver se os pods do keycloak subiram.

### Subindo as aplicações back-end

Para subir os containers do serviço de apostas bets, siga os passos abaixo:

Abra um terminal e execute o comando: `kubectl create ns bets`.

Agora, copie o path completo da pasta: `infra/kong-k8s/misc/apps` e cole no comando:
`kubectl apply -f {path} --recursive -n bets`.
![img_3.png](readme_images/img_3.png)

---

## Configurando os plugins do Kong pelo k8s

**Vamos configurar o plugin de rate limit por header:**

Copie o path completo do arquivo: `infra/kong-k8s/misc/apis/kratelimit.yaml`.

Abra um terminal  e execute o comando com path acima: `kubectl apply -f {path} -n bets`.
![img_4.png](readme_images/img_4.png)

**Vamos configurar o plugin de prometheus globalmente:**

Copie o path completo do arquivo: `infra/kong-k8s/misc/apis/kprometheus.yaml`.

Abra um terminal  e execute o comando com path acima: `kubectl apply -f {path}`.
![img_5.png](readme_images/img_5.png)