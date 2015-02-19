from gpaw import GPAW
from ase import Atoms
from ase import Atom
import numpy as np
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw.eigensolvers import Davidson
from gpaw import PW


# att göra:
# lägg till sc som structure = 3
# lägg till möjlighet att bland in annan atomType
# leta eMin för olika latticeparameter

structure = 1 # 1 for fcc, 2 for bcc
atomType = 'Al'

cutoff = 300
lattice = 4.0

if structure == 1: 
  #fcc
  p = ((0,0,0),(lattice/2, lattice/2, 0),(lattice/2, 0, lattice/2),(0,lattice/2, lattice/2))
if structure == 2:
  #bcc
  p = ((0,0,0),(lattice/2, lattice/2, lattice/2),(lattice, 0, 0),(3*lattice/2,lattice/2, lattice/2))
  
mol = Atoms()

for i in range(4):
  atom = Atom(atomType, p[i])
  mol.append(atom)

mol.pbc = True
mol.cell = [lattice, lattice, lattice]

calc = GPAW(mode=PW(cutoff), h = 0.2, xc='PBE', nbands = 24, eigensolver='dav', kpts = (6,6,6), txt='out_home.txt')

mol.set_calculator(calc)



dyn = BFGS(mol, trajectory='out_home.traj', logfile='out_home.log')
dyn.run(fmax = 0.001)
