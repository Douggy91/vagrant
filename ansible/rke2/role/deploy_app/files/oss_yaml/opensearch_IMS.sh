#!/bin/sh

##Solr Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/solr_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "solr delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "solr-*"
                ]           
            }
        ]
    }
}'

## Redis Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/redis_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "redis delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "redis-*"
                ]           
            }
        ]
    }
}'

## Opensearch Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/opensearch_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "opensearch delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "opensearch-*"
                ]           
            }
        ]
    }
}'


## MariaDB Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/mariadb_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "mariadb delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "mariadb-*"
                ]           
            }
        ]
    }
}'

## zookeeper Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/zookeeper_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "zookeeper delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "2d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "kubernetes-zookeeper-*"
                ]           
            }
        ]
    }
}'

## Aibot Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/server-aibot_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "server-aibot delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "server-aibot-*"
                ]           
            }
        ]
    }
}'

##Chub Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/server-chub_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "server-chub delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "server-chub-*"
                ]           
            }
        ]
    }
}'

##AMP Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/server-amp_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "server-amp delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "server-amp-*"
                ]           
            }
        ]
    }
}'

## TTS Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/server-tts_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "server-tts delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "server-tts-*"
                ]           
            }
        ]
    }
}'

##sysctl_delete_policy Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/sysctl_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "sysctl  delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "7d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "sysctl-*"
                ]           
            }
        ]
    }
}'

## Chub-metric Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/chub-metric_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "chub-metric  delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "7d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "chub-metric*"
                ]           
            }
        ]
    }
}'

## Chub-log Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/chub-log_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "chub-log  delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "7d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "chub-log*"
                ]           
            }
        ]
    }
}'

## STT Index 보관주기 정책
curl -XPUT  'http://opensearch.opensearch.svc.cluster.local:9200/_plugins/_ism/policies/server-stt_delete_policy' -H 'Content-Type: application/json' -d \
'{
    "policy": {
        "description": "server-stt delete policy",
        "default_state": "hot",
        "states": [
            {
              "name": "hot",
              "actions": [],
              "transitions": [
                {
                  "state_name": "delete",
                  "conditions": {
                      "min_index_age": "3d"
                  }
                }
              ]
            },
            {
              "name": "delete",
              "actions" : [
                  {
                    "delete" : {}
                  }
                ],
                "transitions": []
            }
        ],
        "ism_template": [
            {
                "index_patterns": [
                    "server-stt-*"
                ]           
            }
        ]
    }
}'