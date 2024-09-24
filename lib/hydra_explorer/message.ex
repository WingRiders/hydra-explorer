defmodule HydraExplorer.Message do
  @moduledoc """
  https://hydra.family/head-protocol/unstable/api-reference/
  As per the docs, we can get the following messages:
  - Greetings
  - PeerConnected
  - PeerDisconnected
  - PeerHandshakeFailure
  - HeadIsInitializing
  - Committed
  - HeadIsOpen
  - HeadIsClosed
  - HeadIsContested
  - ReadyToFanout
  - HeadIsAborted
  - HeadIsFinalized
  - TxValid
  - TxInvalid
  - SnapshotConfirmed
  - GetUTxOResponse
  - InvalidInput
  - PostTxOnChainFailed
  - CommandFailed
  - IgnoredHeadInitializing
  - DecommitInvalid
  - DecommitRequested
  - DecommitApproved
  - DecommitFinalized
  """
  require Logger

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "messages" do
    field :type, Ecto.Enum,
      values: [
        Greetings: 0,
        PeerConnected: 1,
        PeerDisconnected: 2,
        PeerHandshakeFailure: 3,
        HeadIsInitializing: 4,
        Committed: 5,
        HeadIsOpen: 6,
        HeadIsClosed: 7,
        HeadIsContested: 8,
        ReadyToFanout: 9,
        HeadIsAborted: 10,
        HeadIsFinalized: 11,
        TxValid: 12,
        TxInvalid: 13,
        SnapshotConfirmed: 14,
        GetUTxOResponse: 15,
        InvalidInput: 16,
        PostTxOnChainFailed: 17,
        CommandFailed: 18,
        IgnoredHeadInitializing: 19,
        DecommitInvalid: 20,
        DecommitRequested: 21,
        DecommitApproved: 22,
        DecommitFinalized: 23
      ]

    # The whole message body
    # You probably don't want to query messages directly
    field :json, :string
  end

  def to_message(message_db) do
    tag = "#{message_db.type}"
    json = Jason.decode!(message_db.json)
    decode_message(Map.put(json, "tag", tag))
  end

  def to_message_db(message, map? \\ true) do
    type = message.__struct__ |> Module.split() |> List.last() |> String.to_existing_atom()
    json = Jason.encode!(Map.from_struct(message))

    if map? do
      %{type: type, json: json}
    else
      %HydraExplorer.Message{type: type, json: json}
    end
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:type, :json])
    |> validate_required([:type, :json])
  end

  defmodule Greetings do
    defstruct [:me, :head_status, :snapshot_utxo, :timestamp, :hydra_node_version]
  end

  defmodule PeerConnected do
    defstruct [:peer, :seq, :timestamp]
  end

  defmodule PeerDisconnected do
    defstruct [:peer, :seq, :timestamp]
  end

  defmodule PeerHandshakeFailure do
    defstruct [:remote_host, :our_version, :their_versions, :seq, :timestamp]
  end

  defmodule HeadIsInitializing do
    defstruct [:head_id, :parties, :seq, :timestamp]
  end

  defmodule Committed do
    defstruct [:party, :utxo, :seq, :timestamp]
  end

  defmodule HeadIsOpen do
    defstruct [:head_id, :utxo, :seq, :timestamp]
  end

  defmodule HeadIsClosed do
    defstruct [:head_id, :snapshot_number, :contestation_deadline, :seq, :timestamp]
  end

  defmodule HeadIsContested do
    defstruct [:head_id, :snapshot_number, :seq, :timestamp]
  end

  defmodule ReadyToFanout do
    defstruct [:head_id, :seq, :timestamp]
  end

  defmodule HeadIsAborted do
    defstruct [:head_id, :utxo, :seq, :timestamp]
  end

  defmodule HeadIsFinalized do
    defstruct [:head_id, :utxo, :seq, :timestamp]
  end

  defmodule TxValid do
    defstruct [:head_id, :transaction, :seq, :timestamp]
  end

  defmodule TxInvalid do
    defstruct [:head_id, :utxo, :transaction, :validation_error, :seq, :timestamp]
  end

  defmodule SnapshotConfirmed do
    defstruct [:head_id, :snapshot, :seq, :timestamp]
  end

  defmodule GetUTxOResponse do
    @moduledoc "This one is supposed to be deprecated"
    defstruct [:head_id, :utxo, :seq, :timestamp]
  end

  defmodule InvalidInput do
    defstruct [:reason, :input, :seq, :timestamp]
  end

  defmodule PostTxOnChainFailed do
    defstruct [:post_chain_tx, :post_tx_error, :seq, :timestamp]
  end

  defmodule CommandFailed do
    defstruct [:client_input, :seq, :timestamp]
  end

  defmodule IgnoredHeadInitializing do
    defstruct [:head_id, :contestation_period, :parties, :participants, :seq, :timestamp]
  end

  defmodule DecommitInvalid do
    defstruct [:head_id, :decommit_tx, :decommit_invalid_reason]
  end

  defmodule DecommitRequested do
    defstruct [:head_id, :decommit_tx, :utxo_to_decommit, :seq, :timestamp]
  end

  defmodule DecommitApproved do
    defstruct [:head_id, :decommit_tx_id, :utxo_to_decommit, :seq, :timestamp]
  end

  defmodule DecommitFinalized do
    defstruct [:head_id, :decommit_tx_id, :seq, :timestamp]
  end

  def decode_message(msg)

  def decode_message(%{"tag" => "Greetings"} = msg) do
    %Greetings{
      me: msg["me"],
      head_status: msg["head_status"],
      # optional
      snapshot_utxo: msg["snapshot_utxo"],
      timestamp: as_datetime!(msg["timestamp"]),
      hydra_node_version: msg["hydra_node_version"]
    }
  end

  def decode_message(%{"tag" => "PeerConnected"} = msg) do
    %PeerConnected{
      peer: msg["peer"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "PeerDisconnected"} = msg) do
    %PeerDisconnected{
      peer: msg["peer"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "PeerHandshakeFailure"} = msg) do
    %PeerHandshakeFailure{
      remote_host: msg["remote_host"],
      our_version: msg["our_version"],
      their_versions: msg["their_versions"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsInitializing"} = msg) do
    %HeadIsInitializing{
      head_id: msg["head_id"],
      parties: msg["parties"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "Committed"} = msg) do
    %Committed{
      party: msg["party"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsOpen"} = msg) do
    %HeadIsOpen{
      head_id: msg["head_id"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsClosed"} = msg) do
    %HeadIsClosed{
      head_id: msg["head_id"],
      snapshot_number: msg["snapshot_number"],
      contestation_deadline: msg["contestation_deadline"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsContested"} = msg) do
    %HeadIsContested{
      head_id: msg["head_id"],
      snapshot_number: msg["snapshot_number"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "ReadyToFanout"} = msg) do
    %ReadyToFanout{
      head_id: msg["head_id"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsAborted"} = msg) do
    %HeadIsAborted{
      head_id: msg["head_id"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "HeadIsFinalized"} = msg) do
    %HeadIsFinalized{
      head_id: msg["head_id"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "TxValid"} = msg) do
    %TxValid{
      head_id: msg["head_id"],
      transaction: msg["transaction"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "TxInvalid"} = msg) do
    %TxInvalid{
      head_id: msg["head_id"],
      utxo: msg["utxo"],
      transaction: msg["transaction"],
      validation_error: msg["validation_error"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "SnapshotConfirmed"} = msg) do
    %SnapshotConfirmed{
      head_id: msg["head_id"],
      snapshot: msg["snapshot"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "GetUTxOResponse"} = msg) do
    %GetUTxOResponse{
      head_id: msg["head_id"],
      utxo: msg["utxo"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "InvalidInput"} = msg) do
    %InvalidInput{
      reason: msg["reason"],
      input: msg["input"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "PostTxOnChainFailed"} = msg) do
    %PostTxOnChainFailed{
      post_chain_tx: msg["post_chain_tx"],
      post_tx_error: msg["post_tx_error"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "CommandFailed"} = msg) do
    %CommandFailed{
      client_input: msg["client_tnput"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "IgnoredHeadInitializing"} = msg) do
    %IgnoredHeadInitializing{
      head_id: msg["head_id"],
      contestation_period: msg["contestation_period"],
      parties: msg["parties"],
      participants: msg["participants"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "DecommitInvalid"} = msg) do
    %DecommitInvalid{
      head_id: msg["head_id"],
      decommit_tx: msg["decommit_tx"],
      decommit_invalid_reason: msg["decommit_invalid_reason"]
    }
  end

  def decode_message(%{"tag" => "DecommitRequested"} = msg) do
    %DecommitRequested{
      head_id: msg["head_id"],
      decommit_tx: msg["decommit_tx"],
      utxo_to_decommit: msg["utxo_to_decommit"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "DecommitApproved"} = msg) do
    %DecommitApproved{
      head_id: msg["head_id"],
      decommit_tx_id: msg["decommit_tx_id"],
      utxo_to_decommit: msg["utxo_to_decommit"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{"tag" => "DecommitFinalized"} = msg) do
    %DecommitFinalized{
      head_id: msg["head_id"],
      decommit_tx_id: msg["decommit_tx_id"],
      seq: msg["seq"],
      timestamp: as_datetime!(msg["timestamp"])
    }
  end

  def decode_message(%{} = msg) do
    Logger.warning("Received an unrecognized msg from the Hydra node: #{msg}")
    nil
  end

  defp as_datetime!(timestamp) do
    {:ok, datetime, _} = DateTime.from_iso8601(timestamp)
    datetime
  end
end
