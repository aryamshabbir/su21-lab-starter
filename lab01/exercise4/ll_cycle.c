#include <stddef.h>
#include "2_cycle.h"

int ll_has_cycle(node *head) {
    if (head == NULL) {
        return 0;  // No cycle in an empty list
    }

    node *slow_ptr = head;
    node *fast_ptr = head;

    while (fast_ptr != NULL && fast_ptr->next != NULL) {
        slow_ptr = slow_ptr->next;
        fast_ptr = fast_ptr->next->next;

        if (slow_ptr == fast_ptr) {
            return 1;  // Cycle detected
        }
    }

    return 0;  // No cycle
}
