#include <iostream>

using namespace std;

struct node {
    int info;
    node *left, *right;
};

// New node with P value
node *newn(int p) {
    node *uk = new node();
    uk->info = p;
    return (uk);
}

// Add new node on left
void setleft(node *p, int x) { p->left = newn(x); }

// Add new node on right
void setright(node *p, int x) { p->right = newn(x); }

node *form() {
    int n;
    node *der = NULL, *next, *tek;
    puts("Input integer numbers\nletter means that input is over");
    if (scanf("%d", &n) == 1) {
        der = newn(n);
        while (scanf("%d", &n) == 1) {
            next = tek = der;
            while (next != NULL) {
                tek = next;
                if (n < tek->info)
                    next = tek->left;
                else
                    next = tek->right;
            }
            if (n < tek->info)
                setleft(tek, n);
            else
                setright(tek, n);
        }
    }
    return der;
}

void print_tree(node *der, int h) {
    if (der) {
        print_tree(der->left, h + 1);
        for (int i = 0; i < h; i++)
            cout << "     ";
        cout << der->info << endl;
        print_tree(der->right, h + 1);
    }
}

void DelLeaf(node **der) {
    if (*der == NULL)
        return;
    if ((*der)->left == NULL && (*der)->right == NULL) {
        printf("Leaf %d was deleted\n", (*der)->info);
        delete (*der);
        *der = NULL;
        return;
    }
    DelLeaf(&((*der)->left));
    DelLeaf(&((*der)->right));
}

int main() {
    node *der;
    puts("Now we'll make a tree");
    der = form();
    if (!der)
        puts("Tree is empty");
    else
        print_tree(der, 0);
    DelLeaf(&der);
    if(der){
        puts("The tree after cleanup:");
        print_tree(der, 0);
    }
    else
        puts("The tree is now empty");
}
