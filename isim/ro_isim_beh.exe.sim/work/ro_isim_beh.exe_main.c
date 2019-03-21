/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002061942921_4144013839_init();
    work_m_00000000000514095065_1734863077_init();
    work_m_00000000000730742375_4163643841_init();
    work_m_00000000002113413425_4247227428_init();
    work_m_00000000000237935281_2913944598_init();
    work_m_00000000001313458663_0538605849_init();
    work_m_00000000001420376129_4063364415_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001420376129_4063364415");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
