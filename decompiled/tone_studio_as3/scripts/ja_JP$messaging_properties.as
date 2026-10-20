package
{
   import mx.resources.ResourceBundle;
   
   public class ja_JP$messaging_properties extends ResourceBundle
   {
      
      public function ja_JP$messaging_properties()
      {
         super("ja_JP","messaging");
      }
      
      override protected function getContent() : Object
      {
         return {
            "httpRequestError.details":"エラー :  {0}",
            "errorReadingIExternalizable":"IExternalizable の読み取り中にエラーが発生しました。{0}",
            "couldNotLoadCache":"キャッシュをメッセージストアにロードできませんでした。",
            "cannotRemoveWhenConfigured":"設定された送信先をターゲットとする ChannelSet からチャンネルを削除できません。",
            "deliveryInDoubt.details":"応答を受信する前に、チャンネルが切断されました。",
            "requestTimedOut":"要求がタイムアウトになりました",
            "securityError":"URL へのアクセス中にセキュリティエラーが発生しました",
            "invalidURL":"無効なURL",
            "messageQueueFailedInitialize":"メッセージストアの初期化に失敗しました。",
            "noErrorForMessage.details":"予期されたメッセージは \'{0}\' でしたが、\'{1}\' を受信しました。",
            "couldNotSaveCache":"キャッシュを保存できませんでした。",
            "unknownChannelWithId":"設定にはチャンネル \'{0}\' がありません。",
            "producerConnectError":"プロデューサ接続エラーです。",
            "noAckMessage.details":"mx.messaging.messages.AcknowledgeMessage を予期していましたが、{0} を受信しました",
            "destinationNotSet":"メッセージを送信するには、MessageAgent の送信先を設定する必要があります。",
            "requestTimedOut.details":"サーバーからの応答を受信する前に、送信メッセージに対する要求がタイムアウトになりました。",
            "couldNotRemoveMessageFromQueue":"メッセージを送信する前にメッセージストアから削除できませんでした。",
            "unknownReference":"不明な参照 {0}",
            "noDestinationSpecified":"送信先名を指定する必要があります。",
            "wrongMessageQueueForProducerDetails":"メッセージの送信元はこのプロデューサに関連付けられたメッセージストアではありませんでした。",
            "emptySessionClientId":"セッションの clientId には 0 以外の数値を設定する必要があります。",
            "unknownTraitReference":"不明な trait 参照 {0}",
            "producerSendErrorDetails":"プロデューサが接続されておらずメッセージキューが割り当てらていないので、メッセージを送信することもキューに入れることもできません。",
            "connectTimedOut":"接続の試みがタイムアウトになりました。",
            "httpRequestError":"HTTP 要求に関するエラー",
            "noErrorForMessage":"メッセージに関するエラーは受信されませんでした",
            "pollingNotSupportedAMF":"StreamingAMFChannel はポーリングをサポートしていません。",
            "pollingNotSupportedHTTP":"StreamingHTTPChannel はポーリングをサポートしていません。",
            "noAvailableChannels":"使用可能なチャンネルがありません。",
            "ackFailed.details":"予期されたメッセージは \'{0}\' でしたが、\'{1}\' を受信しました。",
            "couldNotLoadCacheIds":"キャッシュ ID のリストをロードできませんでした。",
            "noAMFXBody":"AMFX パケットが無効です。メッセージ本文が見つかりませんでした",
            "couldNotClearCache":"キャッシュをクリアできませんでした。",
            "unknownDestination":"送信先 \'{0}\' が不明です。",
            "invalidRequestMethod":"無効なメソッドが指定されました。",
            "failedToSubscribe":"コンシューマはターゲット宛先にサブスクライブできませんでした。",
            "destinationWithInvalidMessageType":"送信先 \'{0}\' では、\'{1}\' 型のメッセージを処理できません。",
            "couldNotAddMessageToQueue":"メッセージストアにメッセージを格納できませんでした。プロデューサが接続されていません。メッセージストアから送出された FaultEvent に追加情報があります。",
            "unsupportedAMFXVersion":"サポートされていない AMFX のバージョン : {0}",
            "producerSendError":"送信できませんでした。",
            "noURLSpecified":"チャンネルに URL が指定されていません。",
            "cannotAddWhenConfigured":"設定された送信先をターゲットとする ChannelSet にはチャンネルを追加できません。",
            "unknownChannelClass":"指定されたチャンネルクラス \'{0}\' が見つかりませんでした。",
            "pollingIntervalNonPositive":"チャンネルの pollingInterval は、正の値である必要があります。",
            "cannotAddNullIdChannelWhenClustered":"clustered プロパティが true の ChannelSet には null ID のチャンネルを追加できません。",
            "securityError.details":"送信先 : {0}",
            "referenceMissingId":"参照には ID が必要です。",
            "sendFailed":"送信できませんでした",
            "lsoStorageNotAllowed":"ローカる記憶域は許可されていないのでメッセージストアを初期化できません。Flash Player でローカル記憶域が許可されており、十分な記憶容量があることを確認してください。",
            "ackFailed":"メッセージに対する応答を受信しませんでした",
            "cannotSetClusteredWithdNullChannelIds":"null ID のチャンネルを含む ChannelSet の clustered プロパティは変更できません。",
            "cannotConnectToDestination":"メッセージ送信先への接続を確立できませんでした。",
            "reconnectIntervalNegative":"reconnectInterval に負の値は指定できません。",
            "noURIAllowed":"DirectHTTPChannel でエラーが発生しました。URI を指定できませんでした。",
            "messageQueueSendError":"送信できませんでした。",
            "noServiceForMessageType":"\'{0}\' 型のメッセージを処理するためのサービスが設定されていません。",
            "AMFXTraitsNotFirst":"オブジェクトが無効です。オブジェクト内の先頭エントリとして、traits セットを 1 つ指定する必要があります。",
            "consumerSubscribeError":"コンシューマ登録エラー",
            "noChannelForDestination":"Destination \'{0}\' either does not exist or the destination has no channels defined (and the application does not define any default channels.)",
            "emptyDestinationName":"\'{0}\' は無効な送信先です。",
            "failedToConnect":"プロデューサはターゲット宛先に接続できませんでした。",
            "noAMFXNode":"AMFX パケットが無効です。コンテンツの先頭は <amfx> ノードでなければなりません",
            "resubscribeIntervalNegative":"resubscribeInterval に負の値は指定できません。",
            "noAckMessage":"応答メッセージを受信しませんでした",
            "pollingRequestNotAllowed":"ポーリングが無効になっているときに、\'{0}\' でポーリング要求が送信されました。",
            "queuedMessagesNotAllowedDetails":"このプロデューサにはメッセージキューが割り当てらていないので、キューに入ったメッセージを送信できません。",
            "unknownStringReference":"不明なストリング参照 {0}",
            "authenticationNotSupported":"DirectHTTPChannel では、認証はサポートされていません (プロキシなし)。",
            "deliveryInDoubt":"チャンネルが切断されました",
            "messageQueueNotInitialized":"メッセージストアは初期化されていません。",
            "notImplementingIExternalizable":"クラス {0} では flash.util.IExternalizable を実装する必要があります。",
            "receivedNull":"null 値を受信しました。",
            "unknownDestinationForService":"ID \'{0}\' のサービスに対する送信先 \'{1}\' が不明です。"
         };
      }
   }
}

