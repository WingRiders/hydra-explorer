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
end
