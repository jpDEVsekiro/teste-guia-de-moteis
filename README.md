![image](https://github.com/user-attachments/assets/fb8ec28c-2d0f-4740-8dff-7d6f6ab618fd)

<h1 align="center">
 Teste Técnico Guia de Motéis
</h1>

<div><a href="https://git.io/typing-svg"><a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.herokuapp.com?font=&size=18&duration=3000&pause=1000&color=F7F7F7&width=400&lines=Ol%C3%A1!+Bem+vindo+ao+meu+teste+%F0%9F%91%8B" alt="Typing SVG" /></a></div>
Este aplicativo tem como objetivo ajudar os usuários a encontrarem motéis de forma rápida e eficiente, oferecendo informações sobre localização, preços e avaliações. Neste projeto você irá explorar funcionalidades da tela principal do app.
<div >&nbsp;</div>
   
https://github.com/user-attachments/assets/35ced41b-9e78-488a-9e0e-d4e0538eb1ae

# Gerenciador de Estado
Guia de Motéis utiliza [ChangeNotifier](https://docs.flutter.dev/data-and-backend/state-mgmt/simple) como gerenciador de estado, sendo uma solução leve e rápida para Flutter, que permite criar um projeto organizado e com código limpo de forma nativa sem depender de nenhum package.

![WhatsApp Video 2025-02-12 at 08 49 20_8d8d36e0](https://github.com/user-attachments/assets/c161fe62-a5be-4749-a7fd-cdca628452ef)

# Carrossel
O app ultiliza o package [carousel_slider](https://pub.dev/packages/carousel_slider) para criar todos os widgets de carrosséis de forma simples e personalizável para cada item.

![WhatsApp Video 2025-02-12 at 08 43 49_a0005f37](https://github.com/user-attachments/assets/180ec373-1faa-4adc-8758-9fdde2426575)

# Requisições Http
O app ultiliza o package [http](https://pub.dev/packages/http) para realizar todas as requisições de forma simples e rápida, contendo várias funções de alto-nivel que são mantidas pela própria equipe do [dart.dev](https://dart.dev/).


# Como Rodar o Projeto

É necessário ter [Flutter](https://flutter.dev/) e [Android Studio](https://developer.android.com/studio?hl=pt-br) instalados e configurados corretamente.

1 - Clonar o repositório.
```shell
git clone https://github.com/jpDEVsekiro/teste-guia-de-moteis.git
```

2 - Abrir o projeto no Android Studio.

3 - Rodar `flutter pub get` no terminal.
```shell
flutter pub get
```

4 - Rodar o projeto.
```shell
flutter run
```

# Como Rodar os Testes

Para rodar os [testes unitários](https://docs.flutter.dev/cookbook/testing/unit/introduction) é necessário rodar o comando `flutter test` no terminal.
```shell
flutter test
```
<div >&nbsp;</div>

https://github.com/user-attachments/assets/41478661-68c0-4b98-8d7b-97d37a79f5f1

Para rodar os [testes de integração](https://docs.flutter.dev/testing/integration-tests) é necessário rodar o comando `flutter test integration_test/all_integration_test.dart` no terminal.
```shell
flutter test integration_test/all_integration_test.dart
```
<div >&nbsp;</div>

https://github.com/user-attachments/assets/5e3dc6bb-ca83-4df9-a138-302f96ddca9d
