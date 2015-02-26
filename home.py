from gpaw import GPAW
from ase import Atoms
from ase import Atom
import numpy as np
from ase.io.trajectory import PickleTrajectory
from ase.optimize.bfgs import BFGS
from gpaw.eigensolvers import Davidson
from gpaw import PW


# att gora:
# lagg till sc som structure = 3
# lagg till mojlighet att bland in annan atomType
# leta eMin for olika latticeparameter

structure = 2 # 1 for fcc, 2 for bcc, 3 for sc
atomTypes = ['Al', 'Mg']
selectType = [0,0,0,0]

cutoff = 300
minLattice = 2.0
maxLattice = 3.0
nLatticeSteps = 15

latticeSteps = np.linspace(minLattice, maxLattice, nLatticeSteps)

print('Structure')
print(structure)
print('Atom types')
print(atomTypes)
print('Types used')
print(selectType)
print('min and max lattice constant, in n steps')
print([minLattice,maxLattice, nLatticeSteps])
print('PW cutoff')
print(cutoff)
print('kPts = 8')

for lattice in latticeSteps:
  mol = Atoms()
  
  if structure == 1: 
    #fcc
    p = ((0,0,0),(lattice/2, lattice/2, 0),(lattice/2, 0, lattice/2),(0,lattice/2, lattice/2))
  if structure == 2:
    #bcc
    p = ((0,0,0),(lattice/2, lattice/2, lattice/2),(lattice, 0, 0),(3*lattice/2,lattice/2, lattice/2))
  if structure == 3:
    #sc
    p = ((0,0,0), (lattice,0,0), (2*lattice, 0, 0), (3*lattice,0,0))
  

  for i in range(4):
    atom = Atom(atomTypes[selectType[i]], p[i])
    mol.append(atom)

  if structure == 1:
    #fcc
    mol.cell = [lattice, lattice, lattice]
  if structure == 2:
    #bcc
    mol.cell = [2*lattice, lattice, lattice]
  if structure == 3:
    #sc
    mol.cell = [4*lattice, lattice, lattice]
  
  mol.pbc = True



  calc = GPAW(mode=PW(cutoff), h = 0.2, xc='PBE', nbands = 24, eigensolver='dav', kpts = (8,8,8), txt='out_home.txt')

  mol.set_calculator(calc)
  print(mol.get_potential_energy())


