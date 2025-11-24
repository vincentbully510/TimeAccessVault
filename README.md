**TimeAccessVault – Clarity Smart Contract**

The **TimeAccessVault** smart contract enables **time-locked access control** on the Stacks blockchain.
It allows the contract owner to grant or revoke access to principals based on **block height**, ensuring that certain actions or data become available only after a specified time.

This makes it ideal for delayed releases, scheduled unlocks, content gating, vesting mechanisms, and time-controlled permissions.

---

**Features**

**Time-locked access control** using Stacks block heights
**Owner-controlled access assignment**
**Grant or revoke access with specified unlock times**
**Check whether a principal currently has unlocked access**
**Simple, secure, and extendable architecture**
* Useful for **vaults**, **delayed governance**, **content gating**, and **scheduled actions**

---

**Contract Overview**

**Data Storage**

| Name             | Type     | Description                                                   |
| ---------------- | -------- | ------------------------------------------------------------- |
| `access-expiry`  | Map      | Maps principals to the block height when access becomes valid |
| `contract-owner` | Constant | Principal authorized to manage access                         |

---

**Public Functions**

| Function        | Description                                      |
| --------------- | ------------------------------------------------ |
| `grant-access`  | Owner assigns time-locked access for a principal |
| `revoke-access` | Owner removes access for a principal             |

---

**Read-Only Functions**

| Function          | Description                                                           |
| ----------------- | --------------------------------------------------------------------- |
| `has-access?`     | Returns true if current block height meets or exceeds the unlock time |
| `get-unlock-time` | Returns the unlock block height for a principal                       |
| `get-owner`       | Returns the contract owner                                            |

---

**Usage Examples**

**Grant Access Until a Future Block**

```clarity
(contract-call? .TimeAccessVault grant-access tx-sender u5000)
```

**Revoke Access**

```clarity
(contract-call? .TimeAccessVault revoke-access tx-sender)
```

### **Check Access**

```clarity
(contract-call? .TimeAccessVault has-access? tx-sender)
```

---

**Testing (Clarinet)**

Run:

```bash
clarinet test
```

Recommended test cases:

* Owner can grant/revoke access
* Non-owner attempts fail
* `has-access?` behaves correctly before and after unlock block
* Unlock time updates correctly

---

**Suggested Project Structure**

```
/contracts
   └── TimeAccessVault.clar
/tests
   └── TimeAccessVault_test.ts
README.md
Clarinet.toml
```

---

**Security Notes**

* Only the **contract owner** can modify access permissions.
* Block height is deterministic and reliable for time-based logic.
* Contract designed to be minimal, auditable, and extendable.

---

**Contributing**

Contributions are welcome!
Submit issues, improvements, or feature requests using GitHub Pull Requests.

---

**License**

Licensed under the **MIT License**.

---


