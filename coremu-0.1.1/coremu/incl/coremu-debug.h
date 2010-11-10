/*
 * COREMU Parallel Emulator Framework
 *
 * This file provides basic debugging utilities for COREMU (NOT QEMU).
 *
 * Copyright (C) 2010 Parallel Processing Institute (PPI), Fudan Univ.
 *  <http://ppi.fudan.edu.cn/system_research_group>
 *
 * Authors:
 *  Zhaoguo Wang    <zgwang@fudan.edu.cn>
 *  Yufei Chen      <chenyufei@fudan.edu.cn>
 *  Ran Liu         <naruilone@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _CM_DEBUG_H
#define _CM_DEBUG_H

#include <stdio.h>

#if defined(DEBUG_COREMU)
# define coremu_debug(fmt, args...) fprintf(stderr, "[COREMU] %s(line %d), %s " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args)
#else
# define coremu_debug(fmt, args...)
#endif

#if defined(VERBOSE_COREMU)
# define coremu_print(fmt, args...) fprintf(stderr, "%s(line %d), %s: " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args)
# define coremu_out(fmt, args...) printf("%s(line %d), %s: " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args)
# define coremu_fprint(stream, fmt, args...) fprintf(stream, "%s(line %d), %s: " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args)
#else  /* null .. */
# define coremu_print(fmt, args...)
# define coremu_out(fmt, args...)
# define coremu_fprint(stream, fmt, args...)
#endif

#if !defined(NDEBUG)
# define coremu_assert(exp, fmt, args...) { \
      if(! (exp)) { \
          fprintf(stderr, "%s(line %d), %s: " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args); \
      } \
      assert((exp)); }
#else
# define coremu_assert(exp, fmt, args...)
#endif

#ifdef CONFIG_COREMU
/* always have effect... */
# define coremu_foutput(stream, fmt, args...) fprintf(stream, "%s(line %d), %s: " fmt "\n", __FILE__, __LINE__, __FUNCTION__, ##args);
#endif

#endif /* _DEBUG_H */

