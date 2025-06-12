#include <string.h>
#include "ex1.h"

int num_occurrences(char *str, char letter) {
    /* TODO: implement num_occurances */
    int count=0;
    for (int i=0; i<strlen(str);i++){
        if(str[i]==letter){
            count++;
        }
    }
    return count;

   
}
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    /* TODO: implement compute_nucleotide_occurances */
    dna_seq->A_count = num_occurrences(dna_seq->sequence, 'A');
    dna_seq->C_count = num_occurrences(dna_seq->sequence, 'C');
    dna_seq->G_count = num_occurrences(dna_seq->sequence, 'G');
    dna_seq->T_count = num_occurrences(dna_seq->sequence, 'T');
    return;
}
