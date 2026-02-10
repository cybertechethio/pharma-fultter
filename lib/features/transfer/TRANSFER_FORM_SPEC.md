# Transfer Form – Specification

## 1. Data model (unchanged)

- **CreateTransferRequest**: `destinationBranchId`, `notes`, `items` (list of `CreateTransferItemRequest`).
- **CreateTransferItemRequest**: `itemId`, `batches` (list of `CreateTransferBatchRequest`).
- **CreateTransferBatchRequest**: `batchNumber`, `quantity`.

So each transfer line is: **one item** with **one or more batches**, each batch having **batch number + quantity**.

---

## 2. UI flow

1. **Branch**  
   User selects destination branch from dropdown → save to state as `destinationBranchId`.

2. **Note**  
   User enters a note → save to state as `notes`.

3. **Add items**  
   User taps “Add items” → **item modal** opens (same pattern as transaction form).  
   User selects an item and adds it → that **item** is added to the cart (no batch/quantity yet).

4. **List of added items**  
   UI shows all added items. For **each** added item:
   - Item identity (e.g. name/code).
   - One or more **batch rows**:
     - **Batch dropdown**: choose a batch for that item (from that item’s batches, e.g. from `ItemWithBatches`).
     - **Quantity**: amount for that batch.
   - User can **add** another batch row (same item, different batch + quantity).
   - User can **remove** a batch row.

5. **Batch number**  
   Batch number is not typed by the user; it comes from the selected batch in the dropdown when building `CreateTransferBatchRequest(batchNumber, quantity)`.

Same overall pattern as the transaction form (branch/notes + “cart” of lines), but each line is **item + list of (batch, quantity)** instead of **item + single quantity**.

---

## 3. State shape (after refactor)

- **Request**  
  Keep `CreateTransferRequest` in state (`destinationBranchId`, `notes`, `items: []` until building for submit).

- **Cart**
  - **Items**: need **item + its batches** for display and batch dropdown. Store **Map<int, ItemWithBatches>** (itemId → item with batches).
  - **Batch selections per item**: for each item, the list of (batch, quantity) the user added. Store **Map<int, List<CreateTransferBatchRequest>>** (itemId → list of `{ batchNumber, quantity }`).

- **buildRequest()**  
  Build `CreateTransferRequest` from:
  - `destinationBranchId` and `notes` from state.
  - `items`: for each itemId in cart, one `CreateTransferItemRequest(itemId, batches: cartItemBatches[itemId])` (only include items that have at least one batch).

Validation (e.g. on `CreateTransferRequest.validate()`): destination branch, notes length, at least one item, each item has at least one batch, each batch has quantity > 0 and non-empty batchNumber.

---

## 4. Architecture (aligned with existing features)

- **State**: `TransferFormState` (freezed) with:
  - `request: CreateTransferRequest` (destinationBranchId, notes, items: []),
  - `cartItems: Map<int, ItemWithBatches>`,
  - `cartItemBatches: Map<int, List<CreateTransferBatchRequest>>`.

- **Notifier**: `TransferFormNotifier` with:
  - `setDestinationBranch`, `setNotes`,
  - `addToCart(ItemWithBatches)`, `deleteFromCart(itemId)`,
  - `addBatchToItem(itemId, batchNumber, quantity)` (or equivalent),
  - `removeBatchFromItem(itemId, index)`,
  - `updateBatchQuantity(itemId, index, quantity)` if we want in-place edit,
  - `buildRequest()`, `reset()`, `clearCart()`.

- **UI**: Same flow as transaction (branch dropdown, note field, “Add items” opening a modal). In the transfer form, the list of lines is “per item + list of (batch dropdown, quantity)” with a remove-batch control per row. Item modal uses **ItemWithBatchesNotifier** so we have items with batches for the dropdowns.

---

## 5. Remove actions

- **Remove one batch**: Each batch row has a **remove icon**; user can remove that batch row only (that batch+quantity from that item).
- **Remove the item**: Each item has a **separate icon** to remove the whole item (and all its batch rows).

So: one icon per batch row (remove that batch), one icon per item (remove the entire item).

---

## 6. Validation and button rules

- **If batches are empty for item A**  
  In the add-items modal, the **Add** button for item A is **disabled** (user cannot add an item that has no batches).

- **If quantity of a batch is 0**  
  The **Add** (or equivalent) action for that batch row is **disabled** (e.g. cannot confirm/add that batch with quantity 0).

- **Quantity vs available**  
  Quantity of each batch must **not exceed available** (i.e. **quantity ≤ available** for that batch). Use the batch’s available quantity (e.g. from `ItemBatchSummary.quantity`) to validate.

---

## 7. Transfer cart dialog

- **transfer_cart_dialog.dart** is updated to use **ItemWithBatches** (e.g. data from `ItemWithBatchesNotifier` / `itemWithBatchesProvider`).
- The rest of the dialog behaviour (layout, search, scroll, close, etc.) stays the same; only the data source and type (Item → ItemWithBatches) and the rule “Add disabled when item has no batches” are applied.
