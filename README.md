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