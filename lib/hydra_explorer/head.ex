defmodule HydraExplorer.Head do
  use WebSockex

  alias HydraExplorer.Message

  require Logger

  def start_link(state) do
    WebSockex.start_link("ws://127.0.0.1:4001", __MODULE__, state, name: __MODULE__)
  end

  @impl true
  def handle_connect(_conn, state) do
    Logger.info("Connected to a hydra websocket")
    {:ok, state}
  end

  @impl true
  def handle_frame({type, msg}, state) do
    Logger.debug("Received Message - Type: #{inspect(type)} -- Message: #{inspect(msg)}")
    decoded = msg |> Jason.decode!() |> decode_message()
    if decoded, do: HydraExplorer.MessageStore.push(decoded)
    {:ok, state}
  end

  @impl true
  def handle_cast({:send, {type, msg} = frame}, state) do
    Logger.debug("Sending #{type} frame with payload: #{msg}")
    {:reply, frame, state}
  end

  defp decode_message(msg)

  defp decode_message(%{"tag" => "Greetings"} = msg) do
    %Message.Greetings{
      me: msg["me"],
      head_status: msg["headStatus"],
      # optional
      snapshot_utxo: msg["snapshotUtxo"],
      timestamp: as_datetime!(msg["timestamp"]),
      hydra_node_version: msg["hydraNodeVersion"]
    }
  end

  defp decode_message(%{"tag" => "PeerConnected"} = msg) do
    %Message.PeerConnected{
      peer: msg["peer"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "PeerDisconnected"} = msg) do
    %Message.PeerDisconnected{
      peer: msg["peer"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "PeerHandshakeFailure"} = msg) do
    %Message.PeerHandshakeFailure{
      remote_host: msg["remote_host"],
      our_version: msg["our_version"],
      their_versions: msg["their_versions"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsInitializing"} = msg) do
    %Message.HeadIsInitializing{
      head_id: msg["headId"],
      parties: msg["parties"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "Committed"} = msg) do
    %Message.Committed{
      party: msg["party"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsOpen"} = msg) do
    %Message.HeadIsOpen{
      head_id: msg["headId"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsClosed"} = msg) do
    %Message.HeadIsClosed{
      head_id: msg["headId"],
      snapshot_number: msg["snapshotNumber"],
      contestation_deadline: msg["contestationDeadline"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsContested"} = msg) do
    %Message.HeadIsContested{
      head_id: msg["headId"],
      snapshot_number: msg["snapshotNumber"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "ReadyToFanout"} = msg) do
    %Message.ReadyToFanout{
      head_id: msg["headId"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsAborted"} = msg) do
    %Message.HeadIsAborted{
      head_id: msg["headId"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "HeadIsFinalized"} = msg) do
    %Message.HeadIsFinalized{
      head_id: msg["headId"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "TxValid"} = msg) do
    %Message.TxValid{
      head_id: msg["headId"],
      transaction: msg["transaction"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "TxInvalid"} = msg) do
    %Message.TxInvalid{
      head_id: msg["headId"],
      utxo: msg["utxo"],
      transaction: msg["transaction"],
      validation_error: msg["validationError"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "SnapshotConfirmed"} = msg) do
    %Message.SnapshotConfirmed{
      head_id: msg["headId"],
      snapshot: msg["snapshot"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "GetUTxOResponse"} = msg) do
    %Message.GetUTxOResponse{
      head_id: msg["headId"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "InvalidInput"} = msg) do
    %Message.InvalidInput{
      reason: msg["reason"],
      input: msg["input"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "PostTxOnChainFailed"} = msg) do
    %Message.PostTxOnChainFailed{
      post_chain_tx: msg["postChainTx"],
      post_tx_error: msg["postTxError"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "CommandFailed"} = msg) do
    %Message.CommandFailed{
      client_input: msg["clientInput"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "IgnoredHeadInitializing"} = msg) do
    %Message.IgnoredHeadInitializing{
      head_id: msg["headId"],
      contestation_period: msg["contestationPeriod"],
      parties: msg["parties"],
      participants: msg["participants"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "DecommitInvalid"} = msg) do
    %Message.DecommitInvalid{
      head_id: msg["headId"],
      decommit_tx: msg["decommitTx"],
      decommit_invalid_reason: msg["decommitInvalidReason"]
    }
  end

  defp decode_message(%{"tag" => "DecommitRequested"} = msg) do
    %Message.DecommitRequested{
      head_id: msg["headId"],
      decommit_tx: msg["decommitTx"],
      utxo_to_decommit: msg["utxoToDecommit"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "DecommitApproved"} = msg) do
    %Message.DecommitApproved{
      head_id: msg["headId"],
      decommit_tx_id: msg["decommitTxId"],
      utxo_to_decommit: msg["utxoToDecommit"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{"tag" => "DecommitFinalized"} = msg) do
    %Message.DecommitFinalized{
      head_id: msg["headId"],
      decommit_tx_id: msg["decommitTxId"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  defp decode_message(%{} = msg) do
    Logger.warning("Received an unrecognized msg from the Hydra node: #{msg}")
    nil
  end

  defp as_datetime!(timestamp) do
    {:ok, datetime, _} = DateTime.from_iso8601(timestamp)
    datetime
  end
end
