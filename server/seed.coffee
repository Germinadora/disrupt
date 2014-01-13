Meteor.startup ->
  if Disrupt.posts.find().count()==0
    Disrupt.posts.insert 
      title:"Summer Bootcamp"
      slug: "summer-bootcamp"
      feature_media:
        type: 'image'
        url: '/content/images/2014/Jan/Banner_Bootcamp_Fev_2014-4.png'
      excerpt: "O Bootcamp de Germinação de Startups é um programa de imersão, com duração de 12 semanas, cujo objetivo é desenvolver empreendedores e criar novos negócios digitais. Durante este período, o participante percorre todas as etapas de criação de um novo negócio digital."
      content: 
        """
        ####O melhor lugar para começar a empreender!
        A Germinadora é um modelo de desenvolvimento de empreededores por meio de educação na prática. Aqui, quem está pensando em criar um negócio digital tem a oportunidade de aprimorar suas habilidades e desenvolver seus potenciais, colocando a mão na massa.
        ![](/content/images/2014/Jan/2fa116_bfb7523f3ef6411a9b2e2c72d083bf76.jpg)
        """ 
      created_at: new Date()
    Disrupt.posts.insert
      title: "O cara de negócios"
      slug: "o-cara-de-negocios"
      feature_media:
        type: 'image'
        url: '/content/images/2014/Jan/evento_408_banner_bizdev_workshop-3.png'
      excerpt: "Como transformar idéias em negócios viáveis, como criar e identificar quem são os \"clientes\" e como falar com eles? Quais são suas necessidades, caracteristicas... Como criar produtos através de suas dores, estudar concorrentes, identificar mercado e principalmente fazer o \"pitch\" do seu negócio."
      content: """
Quantas vezes você já ouviu "você precisa de um cara de negócios" ? Muitas vezes ficamos imersos em dúvidas ou dedicando tempo demais em planos de negócios e até mesmo em blocos do canvas, enquanto poderíamos estar, não apenas modelando sua idéias, mas desenvolvendo um negócio viável e rentável.

O Cara de Negócios é um treinamento voltado para quem já tem uma Startup Digital e está enfrentando dificuldades no dia-a-dia da operação. Nosso objetivo é descobrir o analista de negócios que existe em você e para isto, vamos abordar todos os aspectos que permitam fazer seu negócio acontecer.
 
Veja os pontos abordados:
 
* Administração de Tempo e processo decisório. 
* Identificação de padrões de mercado, modelagem e concepção de idéias
* Pesquisa, Validação, Planejamento, gestão e processos ágeis. 
* Noções básicas de Recursos Humanos e Gestão financeira
* Técnicas de negociação e Networking.
* Quando, como e por que captar ou não investimento e bootstrapping.
* Como fazer um Pitch perfeito.
 
Todos os assuntos abordados são parte de uma profunda pesquisa sobre as dificuldades que CEO's e Founders de Startups tem para fazer seu negócio decolar. As dúvidas geradas durante o treinamento, podem ser parte do livro O Cara de Negócios que será lançado no segundo quater de 2014.

Todos os participantes do treinamento, farão parte de uma rede privada de troca de informações e terão acesso com exclusividade ao "manuescrito" do livro.
"""
      created_at: new Date()
    
