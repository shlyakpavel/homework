#ifndef WORK_H
#define WORK_H

class Work
{
public:
    Work();
    unsigned char n;
    unsigned long process_recursive();
    unsigned long process_normal();
    unsigned long process_bin();
};

#endif // WORK_H
