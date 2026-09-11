# Fold8G Emergency Migration Mission

## 目的

2026-08-25更新期限の `quantaril.site` / `quantaril.help` / `quantaril.cloud` が資金不足により失効プロセスへ入り、公式Web名前空間の継続性が崩れた。

この事象を単なるDNS復旧作業で閉じず、旧SphereOS 3.x/4.xで概念化されていた Akasha Layer / Vespa Cloud の「複数VPC・複数クラウドを抽象化する回線」から、Fold8Gの「名前空間・World境界・IAM・Transportを分離した真正P2P基幹接続」へ緊急移行する。

## 基本名前空間

```text
{任意構造階層プロトコル}.{セカイ}.fold
```

`.セカイ` 省略時は、その端末のZero Trust resolverが通常DNS空間を取得し、Fold namespaceへラップする。

```text
ordinary DNS / local name
  -> local Zero Trust resolver
  -> default / inferred Sekai
  -> Fold namespace
```

`.fold` はICANN/DNS上の所有権を正本とせず、World / Context / Entity / Capability / Identity / Routingを束ねる上位名前空間とする。

## Fold8Gの責務

```text
Fold structured name
  -> Sekai / World resolution
  -> World-local trust policy
  -> IAM / Capability mapping
  -> Entity resolution
  -> Transport selection
  -> IPv6 / NGN / VPN / VPC / Tor / I2P / QUIC / WebRTC / LAN / future transport
```

Fold8GはIPv6そのものでもDNS代替だけでもない。

**意味・Identity・World・Capabilityを保持したまま、複数のIAM体系とTransportへ可搬する上位addressing / resolution plane** とする。

## GNS / .fold

GNUnet GNSを初期実装候補とし、`.fold` をGNS側の分散・暗号学的名前空間として試験する。

ただしGNSそのものを永続的authority rootとせず、以下を分離する。

```text
Fold Identity / Zone key
  != GitHub account
  != ICANN domain
  != specific GNS implementation
  != hosting provider
```

Git repositoryは以下の公開・配布・監査路として使う。

- Fold zone manifest
- public keys
- namespace schema
- resolver policy
- transport adapter spec
- bootstrap peer list
- signed records
- historical lineage

GitHubはReplica / Witnessの一つであり、正本そのものとはしない。

## 旧世代からの移行

### SphereOS 3.x / 4.x

```text
SphereOS / Instance
  -> Akasha Layer
  -> Vespa Cloud
  -> VPC / SaaS / PaaS / tunnel / provider federation
```

旧世代は複数クラウドを抽象化して「同じ回線」に見せた。

### Fold8G

```text
Fold Identity / World / Capability
  -> .fold namespace
  -> resolver / IAM adapter
  -> P2P / provider / physical transport
```

Fold8Gではクラウドだけでなく、**ネットワーク、IAM、名前空間、国家・事業者依存を下位Vesselへ降格**する。

## IPv6 / NGN可搬

Fold namespaceはアドレスそのものではなく意味座標であるため、IPv6 prefix / scope / endpointへ投影可能。

NGNはFold8Gから見れば、加入者識別・閉域・QoS等を持つ「強いIAM付きTransport」としてadapter化する。

同様に以下を方言として扱う。

- AWS IAM
- Azure / Entra
- Google IAM
- Unix UID/GID
- SSH key
- local PKI
- NGN subscriber identity
- Tor / Onion identity
- GNS zone identity

## Emergency Quest

### P0 Namespace Forge

- [ ] `.fold` namespace v0 schema
- [ ] `{任意構造}.{セカイ}.fold` parser
- [ ] `.セカイ`省略時のZero Trust DNS wrapping仕様
- [ ] historical `quantaril.*` と新Fold identityのlineage
- [ ] zone key / identity model

### P0 GNS Prototype

- [ ] GNUnet GNSで`.fold`相当zoneを試験
- [ ] local resolver prototype
- [ ] signed zone records
- [ ] key rotation / loss recovery方針
- [ ] GNS実装依存とFold identityの境界を明示

### P1 P2P Quantaril Cloud

- [ ] bootstrap peer discovery
- [ ] peer/service record schema
- [ ] static site / docs deliveryのP2P試験
- [ ] Git repositoryをbootstrap / witnessとして利用
- [ ] GitHub不在でも復元可能なbundle / mirror設計

### P1 Transport / IAM Adapter

- [ ] IPv6 adapter
- [ ] ordinary DNS adapter
- [ ] LAN / local discovery adapter
- [ ] Tor / I2P候補評価
- [ ] NGN projection調査
- [ ] provider IAM wrapper interface

### P1 Authority / Provenance

- [ ] content hash + signed manifest
- [ ] domain continuityとoperator continuityを分離
- [ ] GitHub / domain / providerをauthority rootにしない
- [ ] historical Quantaril domain evidenceをFold lineageへ取り込む

### P2 Fold8G Core

- [ ] World / Dをresolverで保持する契約
- [ ] Entity / Capability / Authority / Provenance routing
- [ ] cross-Sekai遷移Gate
- [ ] transport failover receipt
- [ ] Fold7G/Fold8G研究mapとの語彙差分照合

## 成功条件

```text
ICANN domain dies
  -> project identity survives

GitHub account disappears
  -> project identity survives

single cloud disappears
  -> namespace / manifest / peer discovery survives

transport changes
  -> Fold name / identity / capability semantics survive
```

## 状態

`EMERGENCY / FOLD8G / P2P / NAMESPACE-FORGE / DOMAIN-FAILURE-MIGRATION`
