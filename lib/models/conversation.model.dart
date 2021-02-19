class ConversationModel {
  List<Intents> intents;
  List<Entities> entities;
  Input input;
  Output output;
  Context context;
  String userId;

  ConversationModel(
      {this.intents,
        this.entities,
        this.input,
        this.output,
        this.context,
        this.userId});

  ConversationModel.fromJson(Map<String, dynamic> json) {
    if (json['intents'] != null) {
      intents = new List<Intents>();
      json['intents'].forEach((v) {
        intents.add(new Intents.fromJson(v));
      });
    }
    if (json['entities'] != null) {
      entities = new List<Entities>();
      json['entities'].forEach((v) {
        entities.add(new Entities.fromJson(v));
      });
    }
    input = json['input'] != null ? new Input.fromJson(json['input']) : null;
    output =
    json['output'] != null ? new Output.fromJson(json['output']) : null;
    context =
    json['context'] != null ? new Context.fromJson(json['context']) : null;
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.intents != null) {
      data['intents'] = this.intents.map((v) => v.toJson()).toList();
    }
    if (this.entities != null) {
      data['entities'] = this.entities.map((v) => v.toJson()).toList();
    }
    if (this.input != null) {
      data['input'] = this.input.toJson();
    }
    if (this.output != null) {
      data['output'] = this.output.toJson();
    }
    if (this.context != null) {
      data['context'] = this.context.toJson();
    }
    data['user_id'] = this.userId;
    return data;
  }
}

class Intents {
  String intent;
  double confidence;

  Intents({this.intent, this.confidence});

  Intents.fromJson(Map<String, dynamic> json) {
    intent = json['intent'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intent'] = this.intent;
    data['confidence'] = this.confidence;
    return data;
  }
}

class Entities {
  int confidence;
  String entity;

  Entities({this.confidence, this.entity});

  Entities.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    entity = json['entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['entity'] = this.entity;
    return data;
  }
}

class Input {
  String text;

  Input({this.text});

  Input.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class Output {
  List<Generic> generic;
  List<String> text;
  List<String> nodesVisited;

  Output({this.generic, this.text, this.nodesVisited});

  Output.fromJson(Map<String, dynamic> json) {
    if (json['generic'] != null) {
      generic = new List<Generic>();
      json['generic'].forEach((v) {
        generic.add(new Generic.fromJson(v));
      });
    }
    text = json['text'].cast<String>();
    nodesVisited = json['nodes_visited'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.generic != null) {
      data['generic'] = this.generic.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    data['nodes_visited'] = this.nodesVisited;
    return data;
  }
}

class Generic {
  String responseType;
  String text;

  Generic({this.responseType, this.text});

  Generic.fromJson(Map<String, dynamic> json) {
    responseType = json['response_type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_type'] = this.responseType;
    data['text'] = this.text;
    return data;
  }
}

class Context {
  String conversationId;
  System system;
  Metadata metadata;

  Context({this.conversationId, this.system, this.metadata});

  Context.fromJson(Map<String, dynamic> json) {
    conversationId = json['conversation_id'];
    system =
    json['system'] != null ? new System.fromJson(json['system']) : null;
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversation_id'] = this.conversationId;
    if (this.system != null) {
      data['system'] = this.system.toJson();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    return data;
  }
}

class System {
  bool initialized;
  List<DialogStack> dialogStack;
  int dialogTurnCounter;
  int dialogRequestCounter;
  NodeOutputMap nNodeOutputMap;

  System(
      {this.initialized,
        this.dialogStack,
        this.dialogTurnCounter,
        this.dialogRequestCounter,
        this.nNodeOutputMap});

  System.fromJson(Map<String, dynamic> json) {
    initialized = json['initialized'];
    if (json['dialog_stack'] != null) {
      dialogStack = new List<DialogStack>();
      json['dialog_stack'].forEach((v) {
        dialogStack.add(new DialogStack.fromJson(v));
      });
    }
    dialogTurnCounter = json['dialog_turn_counter'];
    dialogRequestCounter = json['dialog_request_counter'];
    nNodeOutputMap = json['_node_output_map'] != null
        ? new NodeOutputMap.fromJson(json['_node_output_map'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initialized'] = this.initialized;
    if (this.dialogStack != null) {
      data['dialog_stack'] = this.dialogStack.map((v) => v.toJson()).toList();
    }
    data['dialog_turn_counter'] = this.dialogTurnCounter;
    data['dialog_request_counter'] = this.dialogRequestCounter;
    if (this.nNodeOutputMap != null) {
      data['_node_output_map'] = this.nNodeOutputMap.toJson();
    }
    return data;
  }
}

class DialogStack {
  String dialogNode;

  DialogStack({this.dialogNode});

  DialogStack.fromJson(Map<String, dynamic> json) {
    dialogNode = json['dialog_node'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dialog_node'] = this.dialogNode;
    return data;
  }
}

class NodeOutputMap {
  BemVindo bemVindo;

  NodeOutputMap({this.bemVindo});

  NodeOutputMap.fromJson(Map<String, dynamic> json) {
    bemVindo = json['Bem-vindo'] != null
        ? new BemVindo.fromJson(json['Bem-vindo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bemVindo != null) {
      data['Bem-vindo'] = this.bemVindo.toJson();
    }
    return data;
  }
}

class BemVindo {
  List<int> l0;

  BemVindo({this.l0});

  BemVindo.fromJson(Map<String, dynamic> json) {
    l0 = json['0'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.l0;
    return data;
  }
}

class Metadata {
  String userId;

  Metadata({this.userId});

  Metadata.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    return data;
  }
}

