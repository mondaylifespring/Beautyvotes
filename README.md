# BeautyVotes

## Description:
BeautyVotes is a decentralized voting app where users can vote for their favorite beauty tips, trends, or products. Each user can cast only one vote per item, and the system keeps track of the votes for each item.

## Features:
- **Vote for beauty items**: Users can vote for their favorite beauty tips, trends, or products.
- **One vote per user**: A user can only vote once for an item.
- **Vote tallying**: The system tallies votes for each item, ensuring fair voting.
- **Item management**: New beauty items can be added to the voting system.

## Smart Contract Overview:

### Data Variables:
- `votes`: A map that tracks the user (principal) and the item they voted for (uint).
- `items`: A map that tracks each beauty item (uint) and its total vote count (uint).
- `total-items`: A counter that keeps track of the total number of items available for voting.

### Functions:

1. **add-item**:
   - Registers a new beauty item for voting.
   - Automatically initializes its vote count to 0 and updates the total item count.

2. **vote**:
   - Allows users to cast a vote for a specific item.
   - Ensures that users can only vote once and that the item exists.

3. **get-votes**:
   - Returns the total number of votes for a specific item.

4. **has-voted**:
   - Checks if a user has already voted.

5. **get-total-items**:
   - Returns the total number of beauty items available for voting.

6. **get-max**:
   - Returns the maximum of two values, used to calculate the highest vote count.

## Usage:
- Users can vote for beauty items by calling the `vote` function.
- New items can be added using the `add-item` function.
- The contract allows reading vote counts and checking user participation via the `get-votes`, `has-voted`, and `get-total-items` functions.